//
//  PrimeCalculator.swift
//  UnitTestingStudy
//
//  Created by Chang-Won Park on 2020/10/07.
//  Copyright © 2020 John Park. All rights reserved.
//
import Foundation

struct PrimeCalculator {
    /*
     * This is slow task, so I want to run on a background thread
     */
    static func calculate(upTo max: Int, completion: @escaping([Int]) -> Void) {
        // push our work straight to a background thread
        DispatchQueue.global().async {
            guard max > 1 else {
                return
            }
            
            // mark all our numbers as prime
            var sieve = [Bool](repeating: true, count: max)
            
            // 0 and 1 are by definition not prime
            sieve[0] = false
            sieve[1] = false
            
            // count from 0 up to the ceiling
            for number in 2 ..< max {
                // if it is marked as prime, then every multiple of it is not prime
                if sieve[number] == true {
                    for multiple in stride(from: number * number, to: sieve.count, by: number) {
                        sieve[multiple] = false
                    }
                }
            }
            
            // collapse out results down to a single array of primes
            let primes = sieve.enumerated().compactMap {$1 == true ? $0 : nil}
            completion(primes)
        }
    }
}
