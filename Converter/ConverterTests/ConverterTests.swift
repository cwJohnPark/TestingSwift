//
//  ConverterTests.swift
//  ConverterTests
//
//  Created by John Park on 2020/05/06.
//  Copyright © 2020 John Park. All rights reserved.
//

import XCTest
@testable import Converter

class ConverterTests: XCTestCase {
    
    var sut: Converter!
    
    override func setUp() {
        // Halt running test as soon as any test fails
        continueAfterFailure = false
        
        // Instantiate test object each test cases
        sut = Converter()
    }
    
    override func tearDown() {
        sut = nil
    }
  
    // 1. No Pattern
    func testFahrenheitToCelsius_noPattern() {
        let sut = Converter() // sut means "system under test"
        
        let input1 = 32.0
        let output1 = sut.convertToCelsius(fahrenheit: input1)
        XCTAssertEqual(output1, 0)
        
        let input2 = 212.0
        let output2 = sut.convertToCelsius(fahrenheit: input2)
        XCTAssertEqual(output2, 100)
    }
    
    // 2. given-when-then Pattern
    func testFahrenheitToCelsius_withPattern() {
        // given
        let sut = Converter()
        let input1 = 32.0
        
        // when
        let output1 = sut.convertToCelsius(fahrenheit: input1)
        
        // then
        XCTAssertEqual(output1, 0)
        
        // given
        let input2 = 212.0
        
        // when
        let output2 = sut.convertToCelsius(fahrenheit: input2)
        
        // then
        XCTAssertEqual(output2, 100)
    }
    
    // 3. Rearrange two patterns into one
    func testFahrenheitToCelsius_prettier() {
        // given
        let sut = Converter()
        let input1 = 32.0
        let input2 = 212.0
        
        // when
        let output1 = sut.convertToCelsius(fahrenheit: input1)
        let output2 = sut.convertToCelsius(fahrenheit: input2)
        
        // then
        XCTAssertEqual(output1, 0)
        XCTAssertEqual(output2, 100)
    }
  
    // 4-1. Isolate test cases
    func test32FahrenheitIsZeroCelsius_isolated() {
        // given
        let sut = Converter()
        let input = 32.0
        
        // when
        let celsius = sut.convertToCelsius(fahrenheit: input)
        
        // then
        XCTAssertEqual(celsius, 0)
    }
    
    // 4-2. Isolate test cases
    func test212FahreheitIs100Celsius_isolated() {
        // given
        let sut = Converter()
        let input = 212.0
        
        // when
        let celsius = sut.convertToCelsius(fahrenheit: input)
        
        // then
        XCTAssertEqual(celsius, 100)
    }
    
    // 5. Test Refactored Object
    func test32FahrenheitIsZeroCelsius_refactored() {
        // given
        let input = 32.0
        
        let celsius = sut.convertToCelsius_refactored(fahrenheit: input)
        
        //XCTAssertEqual failed: ("2.2168933355715126e-12") is not equal to ("0.0")
        XCTAssertNotEqual(celsius, 0)
    }
    
    // 6-1. Specifying an accuracy
    func test32FahrenheitIsZeroCelsius_accuracy() {
        // given
        let input = 32.0
        
        // when
        let celsius = sut.convertToCelsius_refactored(fahrenheit: input)
        
        // then
        XCTAssertEqual(celsius, 0, accuracy: 0.000001)
    }
    
    // 6-2. Specifying an accuracy
    func test100FahrenheitIs37Celsius_accuracy() {
        // given
        let input = 100.0
        
        // when
        let celsius = sut.convertToCelsius_refactored(fahrenheit: input)
        
        // then
        XCTAssertEqual(celsius, 37.777777, accuracy: 0.000001)
    }
}
