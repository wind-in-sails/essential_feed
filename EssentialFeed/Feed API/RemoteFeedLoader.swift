//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Sergey Kudryavtsev on 06.01.2024.
//

import Foundation

// ---------------------------

public final class RemoteFeedLoader {
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }

    public enum Result: Equatable {
        case success([FeedItem])
        case failure(Error)
    }

    private let url: URL
    private let client: HTTPClient

    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }

    private func map(_ data: Data, _ response: HTTPURLResponse) -> Result {
        do {
            let items = try FeedItemsMapper.map(data, response: response)
            return .success(items)
        } catch {
            return .failure(.invalidData)
        }
    }
    
    public func load(completion: @escaping (Result) -> Void) {
        client.get(from: url) { [weak self] result in
            switch result {
            case .success(let data, let response):
                if let self = self {
                    completion(self.map(data, response))
                }
            case .failure:
                completion(.failure(.connectivity))
            }
        }
    }
}
