//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by Sergey Kudryavtsev on 08.01.2024.
//

import Foundation

internal final class FeedItemsMapper {
    private static let OK_200 = 200

    private struct Root: Decodable {
        let items: [Item]

        var feed: [FeedItem] {
            items.map { $0.item }
        }
    }

    private struct Item: Decodable {
        let id: UUID
        let description: String?
        let location: String?
        let image: URL

        var item: FeedItem {
            return FeedItem (
                id: id,
                description: description,
                location: location,
                imageURL: image
            )
        }
    }

    internal static func map(_ data: Data, from response: HTTPURLResponse) -> RemoteFeedLoader.Result {
        guard response.statusCode == OK_200,
              let root = try? JSONDecoder().decode(Root.self, from: data) else {
            return .failure(.invalidData)
        }
        return .success(root.feed)
    }
}
