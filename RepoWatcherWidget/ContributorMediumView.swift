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
                Spacer()
            }
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()),
                                     count: 2),
                      alignment: .leading,
                      spacing: 20) {
                
                ForEach(0..<4) { i in
                    HStack {
                        Image(.avatar)
                            .resizable()
                            .frame(width: 44, height: 44)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text("Danielle Lewis")
                                .font(.caption)
                                .minimumScaleFactor(0.7)
                            Text("22")
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
        .padding([.top, .bottom])
    }
}

struct ContributorMediumView_Previews: PreviewProvider {
    static var previews: some View {
        ContributorMediumView(repo: MockData.repoOne)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
            .containerBackground(for: .widget) { }
    }
}
