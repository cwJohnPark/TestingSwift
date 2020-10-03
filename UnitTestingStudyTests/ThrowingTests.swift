//
//  ThrowingTests.swift
//  UnitTestingStudyTests
//
//  Created by John Park on 2020/05/10.
//  Copyright © 2020 John Park. All rights reserved.
//

import XCTest

@testable import UnitTestingStudy

enum GameError: Error {
    case notPurchased
    case notInstalled
    case parentalControlsDisallowed
}

struct Game {
    let name: String
    
    func play() throws {
        if name == "BioBlitz" {
            throw GameError.notPurchased
        } else if name == "Blastazap" {
            throw GameError.notInstalled
        } else if name == "Dead Storm Rising" {
            throw GameError.parentalControlsDisallowed
        } else {
            print("\(name) is OK to Play!")
        }
    }
}

class ThrowingTests: XCTestCase {
    
    func testPlayingBioBlitzThrows_catch() {
        let game = Game(name: "BioBlitz")
        do {
            try game.play()
            XCTFail()
        } catch GameError.notPurchased {
            // success !
        } catch {
            XCTFail()
        }
    }
    
    func testPlayingBioBlitzThrows_basic() {
        let game = Game(name: "BioBlitz")
        do {
            try game.play()
            XCTFail("BioBlitz has not been purchased")
        } catch {}
    }


}
