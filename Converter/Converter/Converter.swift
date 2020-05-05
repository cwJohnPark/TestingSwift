//
//  Converter.swift
//  Converter
//
//  Created by John Park on 2020/05/06.
//  Copyright © 2020 John Park. All rights reserved.
//

import Foundation

struct Converter {
    func convertToCelsius(fahrenheit: Double) -> Double {
        return (fahrenheit - 32) * 5 / 9
    }
}

