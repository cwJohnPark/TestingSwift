//
//  Converter.swift
//  UnitTestingStudy
//
//  Created by Chang-Won Park on 2020/10/03.
//  Copyright © 2020 John Park. All rights reserved.
//

import Foundation

struct Converter {
    func convertToCelsius(fahrenheit: Double) -> Double {
        return (fahrenheit - 32) * 5 / 9
    }
    
    func convertToCelsius_refactored(fahrenheit: Double) -> Double {
        let fahrenheit = Measurement(value: fahrenheit, unit: UnitTemperature.fahrenheit)
        let celsius = fahrenheit.converted(to: .celsius)
        return celsius.value
    }
    
}

struct ConverterWithFoundation {
    func convertToCelsius(fahrenheit: Double) -> Double {
        let fahrenheit = Measurement(value: fahrenheit, unit: UnitTemperature.fahrenheit)
        let celsius = fahrenheit.converted(to: .celsius)
        return celsius.value
    }
}
