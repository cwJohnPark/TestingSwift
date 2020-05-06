//
//  ConverterWithFoundation.swift
//  Converter
//
//  Created by John Park on 2020/05/07.
//  Copyright © 2020 John Park. All rights reserved.
//

import Foundation

struct ConverterWithFoundation {
    func convertToCelsius(fahrenheit: Double) -> Double {
        let fahrenheit = Measurement(value: fahrenheit, unit: UnitTemperature.fahrenheit)
        let celsius = fahrenheit.converted(to: .celsius)
        return celsius.value
    }
}
