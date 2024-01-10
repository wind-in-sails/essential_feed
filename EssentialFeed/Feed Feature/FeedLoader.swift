//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Sergey Kudryavtsev on 05.01.2024.
//

import Foundation

public enum LoadFeedResult <Error: Swift.Error> {
    case success([FeedItem])
    case failure(Error)
}

extension LoadFeedResult: Equatable where Error: Equatable {}

protocol FeedLoader {
    associatedtype Error: Swift.Error
    func load(completion: @escaping (LoadFeedResult<Error>) -> Void)
}
