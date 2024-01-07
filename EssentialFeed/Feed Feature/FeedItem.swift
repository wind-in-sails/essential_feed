//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Sergey Kudryavtsev on 05.01.2024.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
