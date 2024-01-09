//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Sergey Kudryavtsev on 08.01.2024.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
