//
//  LifecycleTests.swift
//  UnitTestingStudyTests
//
//  Created by Chang-Won Park on 2020/10/04.
//  Copyright © 2020 John Park. All rights reserved.
//

import XCTest

class LifecycleTests: XCTestCase {

    override class func setUp() {
        print("In class setup.")
    }

    override class func tearDown() {
        print("In class tearDown.")
    }

    // It is called before test case even starts.
    override func setUp() {
        print("In setUp.")
    }
    
    override func tearDown() {
        print("In tearDown.")
    }
    
    func testExample() {
        print("Starting test.")
        
        addTeardownBlock {
            print("In first tearDown block")
        }
        
        print("In middle of test.")
        
        addTeardownBlock {
            print("In second tearDown block")
        }
        
        print("Finishing Test.")
    }

}
