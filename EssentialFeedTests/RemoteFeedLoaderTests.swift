//
//  RemoteFeedLoaderTests.swift
//  RemoteFeedLoaderTests
//
//  Created by Sergey Kudryavtsev on 05.01.2024.
//

import XCTest
@testable import EssentialFeed

class RemoteFeedLoader: FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void) {
        HTTPClient.instance.requestedURL = URL(string: "https://a-url.com")
    }
}

class HTTPClient {
    static let instance = HTTPClient()
    private init () {}
    var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient.instance
        _ = RemoteFeedLoader()
        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestsDataFromURL() {
        let client = HTTPClient.instance
        let sut = RemoteFeedLoader()
        sut.load { _ in

        }
        XCTAssertNotNil(client.requestedURL)
    }
}
