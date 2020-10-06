//
//  AsynchronousTests.swift
//  AsynchronousTests
//
//  Created by Chang-Won Park on 2020/10/07.
//  Copyright © 2020 John Park. All rights reserved.
//

import XCTest
@testable import UnitTestingStudy

class AsynchronousTests: XCTestCase {

    func testPrimesUpTo100ShouldBe0_BadImplementation() {
        // given
        let maximumCount = 100
        
        // when
        PrimeCalculator.calculate(upTo: maximumCount) {
            // then
            XCTAssertEqual($0.count, 0)
        }
    }

}
