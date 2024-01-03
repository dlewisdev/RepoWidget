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
                                        avatarData: Data(),
                                        contributors: [
                                            Contributor(login: "dlewisdev", avatarUrl: "", contributions: 22, avatarData: Data()),
                                            Contributor(login: "dwyanewade", avatarUrl: "", contributions: 44, avatarData: Data()),
                                            Contributor(login: "gorandragic", avatarUrl: "", contributions: 28, avatarData: Data()),
                                            Contributor(login: "jimmybutler", avatarUrl: "", contributions: 50, avatarData: Data())])
    
    static let repoOneV2 = Repository(name: "Repository 1",
                                        owner: Owner(avatarUrl: ""),
                                        hasIssues: true,
                                        forks: 30,
                                        watchers: 777,
                                        openIssues: 29,
                                        pushedAt: "2023-12-22T03:01:53Z",
                                        avatarData: Data(),
                                        contributors: [
                                            Contributor(login: "dlewisdev", avatarUrl: "", contributions: 36, avatarData: Data()),
                                            Contributor(login: "dwyanewade", avatarUrl: "", contributions: 49, avatarData: Data()),
                                            Contributor(login: "gorandragic", avatarUrl: "", contributions: 33, avatarData: Data()),
                                            Contributor(login: "jimmybutler", avatarUrl: "", contributions: 60, avatarData: Data())])
    
    static let repoTwo = Repository(name: "Repository 2",
                                        owner: Owner(avatarUrl: ""),
                                        hasIssues: false,
                                        forks: 134,
                                        watchers: 222,
                                        openIssues: 134,
                                        pushedAt: "2023-01-22T03:01:53Z",
                                        avatarData: Data())
}
