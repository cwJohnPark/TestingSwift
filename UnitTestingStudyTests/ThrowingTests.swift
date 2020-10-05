//
//  ThrowingTests.swift
//  UnitTestingStudyTests
//
//  Created by John Park on 2020/05/10.
//  Copyright © 2020 John Park. All rights reserved.
//

import XCTest

@testable import UnitTestingStudy

enum GameError: LocalizedError {
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

extension LocalizedError {
    var errorDescription: String? {
        return "\(self)"
    }
}

class ThrowingTests: XCTestCase {
    
    // MARK: - Throwing tests
    
    func testDeadStormRisingThrows() throws {
        let game = Game(name: "Dead Storm Rising")
        //try game.play() // Caught error: "parentalControlsDisallowed"
    }
    
    // MARK: - Asserting on throws
    
    func testPlayingExplodingMonkeysDoesntThrow() {
        let game = Game(name: "Exploding Monkeys")
        XCTAssertNoThrow(try game.play())
    }
    
    func testPlayingBlastazapThrows_typeCheck() {
        let game = Game(name: "Blastazap")
        
        XCTAssertThrowsError(try game.play()) { (error) in
            XCTAssertEqual(error as? GameError, GameError.notInstalled)
        }
    }
    
    func testPlayingBlastazapThrows() {
        let game = Game(name: "Blastazap")
        XCTAssertThrowsError(try game.play()) // It cannot test the type of error thrown
    }
    
    // MARK: - Try-catch
    
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
            XCTFail("BioBlitz has not been purchased") // it shouldn't be hit
        } catch {}
    }


}

