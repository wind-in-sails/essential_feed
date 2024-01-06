//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Sergey Kudryavtsev on 05.01.2024.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
