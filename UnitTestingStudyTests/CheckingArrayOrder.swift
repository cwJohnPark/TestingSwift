//
//  CheckingArrayOrder.swift
//  UnitTestingStudyTests
//
//  Created by Chang-Won Park on 2020/10/04.
//  Copyright © 2020 John Park. All rights reserved.
//

import XCTest

@testable import UnitTestingStudy

class CheckingArrayOrder: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOrderOfArray() throws {
        // given
        let humanPlayer = Player("Romans")
        let computer1 = Player("Babylonians")
        let computer2 = Player("Vikings")
        
        // when
        humanPlayer.declareWar(on: computer1)
        humanPlayer.declareWar(on: computer2)
        
        // then
        XCTAssertEqual(humanPlayer.enemies, [computer1, computer2])
    }
}

