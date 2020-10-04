//
//  Calculator.swift
//  UnitTestingStudy
//
//  Created by Chang-Won Park on 2020/10/05.
//  Copyright © 2020 John Park. All rights reserved.
//

import Foundation

func divisionRemainder(of number:Int, dividedBy: Int) -> (quotient: Int, remainder: Int) {
    let quotient = number / dividedBy
    let remainder = number % dividedBy
    return (quotient, remainder)
}
