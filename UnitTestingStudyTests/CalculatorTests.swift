//
//  CalculatorTests.swift
//  UnitTestingStudyTests
//
//  Created by Chang-Won Park on 2020/10/05.
//  Copyright © 2020 John Park. All rights reserved.
//

import XCTest
@testable import UnitTestingStudy

class CalculatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDivisonRemainder_Redundant() throws {
        // given
        let dividend = 10
        let divisor = 3
        
        // when
        let result = divisionRemainder(of: dividend, dividedBy: divisor)
        
        // then
        XCTAssertEqual(result.quotient, 3)
        XCTAssertEqual(result.remainder, 1)
    }
    
    // Directives, this test case fails
    func testDivisonRemainder_Directives() throws {
        // given
        let dividend = 10
        let divisor = 3
        
        // when
        let result = divisionRemainder(of: dividend, dividedBy: divisor)
        
        // then
        verifiyDivision_NoDirectives(result, expecetedQuotient: 3, expectedRemainder: 2)
        verifiyDivision(result, expecetedQuotient: 3, expectedRemainder: 2)
    }
    
    // MARK: - Verification Method
    // It will show failure inside this function rather than inside the test case.
    func verifiyDivision_NoDirectives(_ result: (quotient: Int, remainder: Int), expecetedQuotient: Int, expectedRemainder: Int) {
        XCTAssertEqual(result.quotient, expecetedQuotient)
        XCTAssertEqual(result.remainder, expectedRemainder)
    }
    
    /*
     * #file is a Swift compiler directive that refer to the name of the current code file
     * #line is a Swift compiler directive that refer to the line number of the current line of code
     */
    func verifiyDivision(_ result: (quotient: Int, remainder: Int), expecetedQuotient: Int, expectedRemainder: Int, file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(result.quotient, expecetedQuotient, file: file, line: line)
        XCTAssertEqual(result.remainder, expectedRemainder, file: file, line: line)
    }
}
