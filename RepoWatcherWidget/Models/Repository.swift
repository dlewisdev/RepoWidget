//
//  Repository.swift
//  RepoWatcher
//
//  Created by Danielle Lewis on 12/23/23.
//

import Foundation

struct Repository {
    let name: String
    let owner: Owner
    let hasIssues: Bool
    let forks: Int
    let watchers: Int
    let openIssues: Int
    let pushedAt: String
    var avatarData: Data
    
    static let placeholder = Repository(name: "Your Repo", 
                                        owner: Owner(avatarUrl: ""),
                                        hasIssues: true,
                                        forks: 22,
                                        watchers: 444, 
                                        openIssues: 24,
                                        pushedAt: "2023-11-22T03:01:53Z",
                                        avatarData: Data())
}

extension Repository {
    struct CodingData: Decodable {
        let name: String
        let owner: Owner
        let hasIssues: Bool
        let forks: Int
        let watchers: Int
        let openIssues: Int
        let pushedAt: String
        
        var repo: Repository {
            Repository(name: name, 
                       owner: owner,
                       hasIssues: hasIssues,
                       forks: forks,
                       watchers: watchers,
                       openIssues: openIssues,
                       pushedAt: pushedAt,
                       avatarData: Data())
        }
    }
}

struct Owner: Decodable {
    let avatarUrl: String
}
