//
//  NetworkManager.swift
//  RepoWatcher
//
//  Created by Danielle Lewis on 12/23/23.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let decoder = JSONDecoder()
    
    private init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
    }
    
    func getRepo(atURL urlString: String) async throws -> Repository {
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidRepoURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let repo = try decoder.decode(Repository.self, from: data)
            return repo
        } catch {
            throw NetworkError.invalidRepoData
        }
        
    }
    
    func downloadImageData(from urlString: String) async -> Data? {
        guard let url = URL(string: urlString) else { return nil }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            return nil
        }
    }
}

enum NetworkError: Error {
    case invalidRepoURL
    case invalidResponse
    case invalidRepoData
}

enum RepoURL {
    static let swiftNews = "https://api.github.com/repos/sallen0400/swift-news"
    static let coinInfo = "https://api.github.com/repos/dlewisdev/CoinInfo"
    static let publish = "https://api.github.com/repos/johnsundell/publish"
}
