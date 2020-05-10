//
//  UserTest.swift
//  UnitTestingStudyTests
//
//  Created by John Park on 2020/05/09.
//  Copyright © 2020 John Park. All rights reserved.
//

import XCTest
@testable import UnitTestingStudy
class LifeCycleTests: XCTestCase {
    override class func setUp() {
        print("In class setUp.")
    }
    
    override class func tearDown() {
        print("In class tearDown.")
    }
    
    override func setUp() {
        print("In setUp.")
    }
    override func tearDown() {
        print("In tearDown.")
    }
    func testExample() {
        print("Starting test.")
        addTeardownBlock {
            print("In first tearDown block.")
        }
        print("In middle of test.")
        addTeardownBlock {
            print("In second tearDown block.")
        }
        
        print("Finishing test.")
    }
    
    
    
    
}
