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

    func testPrimesUpTo100ShouldBe25_once() {
        // given
        let maximumCount = 100
        let expectation = XCTestExpectation(description: "Calculate primes up to \(maximumCount)")
        
        // when
        PrimeCalculator.calculate(upTo: maximumCount) {
            XCTAssertEqual($0.count, 25)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testPrimesUpTo100ShouldBe25_streaming() {
        // given
        let maximumCount = 100
        let expectation = XCTestExpectation(description: "Calculate primes up to \(maximumCount)")
        expectation.expectedFulfillmentCount = 25
        
        // when
        PrimeCalculator.calculateStreaming(upTo: maximumCount) { number in
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3)
    }
    
    func testPrimesUpTo100ShouldBe25_IndividualCheck() {
        // given
        let maximumCount = 100
        let primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
        var primeCounter = 0
        
        let expectation = XCTestExpectation(description: "Calculate primes up to \(maximumCount)")
        expectation.expectedFulfillmentCount = 25
        
        // when
        PrimeCalculator.calculateStreaming(upTo: maximumCount) { number in
            XCTAssertEqual(primes[primeCounter], number)
            expectation.fulfill()
            primeCounter += 1
        }
        
        wait(for: [expectation], timeout: 3)
    }
}
