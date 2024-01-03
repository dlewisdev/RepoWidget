//
//  ContributorMediumView.swift
//  RepoWatcher
//
//  Created by Danielle Lewis on 1/1/24.
//

import SwiftUI
import WidgetKit

struct ContributorMediumView: View {
    var repo: Repository
    
    var body: some View {
        VStack {
            HStack {
                Text("Top Contributors")
                    .font(.caption).bold()
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 5)
                Spacer()
            }
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()),
                                     count: 2),
                      alignment: .leading,
                      spacing: 20) {
                
                ForEach(repo.contributors) { contributor in
                    HStack {
                        Image(uiImage: UIImage(data: contributor.avatarData) ?? UIImage(named: "avatar")!)
                            .resizable()
                            .frame(width: 44, height: 44)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(contributor.login)
                                .font(.caption)
                                .minimumScaleFactor(0.7)
                            Text("\(contributor.contributions)")
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                                .id(repo.name)
                                .transition(.push(from: .trailing))
                        }
                    }
                }
            }
            
            if repo.contributors.count < 3 {
                Spacer().frame(height: 20)
            }
        }
        .padding([.top, .bottom])
    }
}

#Preview(as: .systemLarge) {
    ContributorWidget()
} timeline: {
    ContributorEntry(date: .now, repo: MockData.repoOne)
    ContributorEntry(date: .now, repo: MockData.repoOneV2)
}
