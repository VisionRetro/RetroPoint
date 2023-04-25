//
//  DieTests.swift
//  RetroPointTests
//
//  Created by Andre Trettin on 25/4/2566 BE.
//

import XCTest
@testable import RetroPoint

final class DieTests: XCTestCase {
    var sut: Die!

    override func setUpWithError() throws {
        sut = Die(.six)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
}
