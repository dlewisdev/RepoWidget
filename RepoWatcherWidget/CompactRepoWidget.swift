//
//  RepoWatcherWidget.swift
//  RepoWatcherWidget
//
//  Created by Danielle Lewis on 12/23/23.
//

import WidgetKit
import SwiftUI

struct CompactRepoProvider: TimelineProvider {
    func placeholder(in context: Context) -> CompactRepoEntry {
        CompactRepoEntry(date: Date(), topRepo: MockData.repoOne, bottomRepo: MockData.repoTwo)
    }

    func getSnapshot(in context: Context, completion: @escaping (CompactRepoEntry) -> ()) {
        let entry = CompactRepoEntry(date: Date(), topRepo: MockData.repoOne, bottomRepo: MockData.repoTwo)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        Task {
            let nextUpdate = Date().addingTimeInterval(43200) // 12 hours in seconds
            
            do {
                // Get Top Repo
                var repo = try await NetworkManager.shared.getRepo(atURL: RepoURL.publish)
                let avatarImageData = await NetworkManager.shared.downloadImageData(from: repo.owner.avatarUrl)
                repo.avatarData = avatarImageData ?? Data()
                
                // Get Bottom Repo if in Large Widget
                var bottomRepo: Repository?
        
                if context.family == .systemLarge {
                    bottomRepo = try await NetworkManager.shared.getRepo(atURL: RepoURL.coinInfo)
                    // These lines are only going to be run if the async networking func above is successful, so we can force unwrap bottomRepo.
                    let avatarImageData = await NetworkManager.shared.downloadImageData(from: bottomRepo!.owner.avatarUrl)
                    bottomRepo!.avatarData = avatarImageData ?? Data()
                }
                
                // Create Entry & Timeline
                let entry = CompactRepoEntry(date: .now, topRepo: repo, bottomRepo: bottomRepo)
                let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
                completion(timeline)
            } catch {
                print("❌ Error - \(error.localizedDescription)")
            }
        }
    }
}

struct CompactRepoEntry: TimelineEntry {
    let date: Date
    let topRepo: Repository
    let bottomRepo: Repository?
}

struct CompactRepoEntryView : View {
    @Environment(\.widgetFamily) var family
    var entry: CompactRepoEntry
    
    
    var body: some View {
        switch family {
        case .systemMedium:
            RepoMediumView(repo: entry.topRepo)
        case .systemLarge:
            VStack(spacing: 56) {
                RepoMediumView(repo: entry.topRepo)
                if let bottomRepo = entry.bottomRepo {
                    RepoMediumView(repo: bottomRepo)
                }
            }
        case .systemSmall, .systemExtraLarge, .accessoryCircular, .accessoryRectangular, .accessoryInline:
            EmptyView()
        @unknown default:
            EmptyView()
        }
       
    }
    

}

struct CompactRepoWidget: Widget {
    let kind: String = "CompactRepoWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: CompactRepoProvider()) { entry in
            if #available(iOS 17.0, *) {
                CompactRepoEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                CompactRepoEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Repo Watcher")
        .description("Keep an eye on one or two GitHub repositories.")
        .supportedFamilies([.systemMedium, .systemLarge])
    }
}

#Preview(as: .systemLarge) {
    CompactRepoWidget()
} timeline: {
    CompactRepoEntry(date: .now, topRepo: MockData.repoOne, bottomRepo: MockData.repoTwo)
    CompactRepoEntry(date: .now, topRepo: MockData.repoOne, bottomRepo: MockData.repoTwo)
}
