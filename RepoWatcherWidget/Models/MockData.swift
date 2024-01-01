//
//  MockData.swift
//  RepoWatcher
//
//  Created by Danielle Lewis on 1/1/24.
//

import Foundation

struct MockData {
    
    static let repoOne = Repository(name: "Repository 1",
                                        owner: Owner(avatarUrl: ""),
                                        hasIssues: true,
                                        forks: 22,
                                        watchers: 444,
                                        openIssues: 24,
                                        pushedAt: "2023-11-22T03:01:53Z",
                                        avatarData: Data())
    
    static let repoTwo = Repository(name: "Repository 2",
                                        owner: Owner(avatarUrl: ""),
                                        hasIssues: false,
                                        forks: 134,
                                        watchers: 222,
                                        openIssues: 134,
                                        pushedAt: "2023-01-22T03:01:53Z",
                                        avatarData: Data())
}
