//
//  XCTTestCase + MemoryLeakingTracking.swift
//  EssentialFeedTests
//
//  Created by Sergey Kudryavtsev on 13.01.2024.
//

import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #file, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(
                instance, "Instance should be deallocated, potential memory leak.",
                file: file,
                line: line
            )
        }
    }
}
