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
    
    override func setUp() {
        // 특정 테스트가 실패할 경우 전체 테스트 진행 도중에 멈출 수 있다.
        continueAfterFailure = false
    }
    
    
    
    // 테스트 케이스의 이름을 가독성있게 작성한다. - 1
    func test32FahrenheitIsZeroCelsius() {
        // given
        let sut = Converter()
        let input1 = 32.0
        
        // when
        let output1 = sut.convertToCelsius(fahrenheit: input1)
        
        // then
        XCTAssertEqual(output1, 0)
    }
    // 테스트 케이스의 이름을 가독성있게 작성한다. - 2
    func test212FahrenheitIs100Celsius() {
        // given
        let sut = Converter()
        let input1 = 212.0
        
        // when
        let output1 = sut.convertToCelsius(fahrenheit: input1)
        
        // then
        XCTAssertEqual(output1, 100)
    }
    
    // 테스트 케이스를 given-when-then 패턴에 맞게 정리한다.
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
    
    // 테스트 케이스를 given-when-then 패턴에 맞게 정리한다.
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
    
    func testFahrenheitToCelsius_noPattern() {
        let sut = Converter()
        
        let input1 = 32.0
        let output1 = sut.convertToCelsius(fahrenheit: input1)
        XCTAssertEqual(output1, 0)
        
        let input2 = 212.0
        let output2 = sut.convertToCelsius(fahrenheit: input2)
        XCTAssertEqual(output2, 100)
    }
   

}
