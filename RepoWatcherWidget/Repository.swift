//
//  Repository.swift
//  RepoWatcher
//
//  Created by Danielle Lewis on 12/23/23.
//

import Foundation

struct Repository: Decodable {
    let name: String
    let owner: Owner
    let hasIssues: Bool
    let forks: Int
    let watchers: Int
    let openIssues: Int
    let pushedAt: String
    
    static let placeholder = Repository(name: "Your Repo", owner: Owner(avatarUrl: ""), hasIssues: true, forks: 22, watchers: 444, openIssues: 24, pushedAt: "2023-12-22T03:01:53Z")
}

struct Owner: Decodable {
    let avatarUrl: String
}
