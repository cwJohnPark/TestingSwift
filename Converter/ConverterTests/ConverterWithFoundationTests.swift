//
//  ConverterWithFoundationTests.swift
//  ConverterTests
//
//  Created by John Park on 2020/05/07.
//  Copyright © 2020 John Park. All rights reserved.
//

import XCTest
@testable import Converter

class ConverterWithFoundationTests: XCTestCase {
    var sut: ConverterWithFoundation!
    
    override func setUp() {
        sut = ConverterWithFoundation()
    }
    override func tearDown() {
        sut = nil
    }
    
    // 부동 소수점 연산을 정확히 계산하기 위해 정밀도 추가
    func test100FahrenheitIs37Celsius() {
        // given
        let input = 100.0
        // when
        let celsius = sut.convertToCelsius(fahrenheit: input)
        // then
        XCTAssertEqual(celsius, 37.777777, accuracy: 0.000001)
    }
}
