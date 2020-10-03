//
//  Player.swift
//  UnitTestingStudy
//
//  Created by Chang-Won Park on 2020/10/04.
//  Copyright © 2020 John Park. All rights reserved.
//

import Foundation

class Player: Equatable {
    
    let nation: String
    var enemies: [Player]
    
    init(_ nation: String) {
        self.nation = nation
        enemies = []
    }
    
    func declareWar(on enemy: Player) {
        enemies.append(enemy)
    }
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.nation == rhs.nation && lhs.enemies == rhs.enemies
    }
    
}


// If your type conforms to Comparable
extension Array where Element: Comparable {
    func fuzzyMatches(other: Array) -> Bool {
        let sortedSelf = self.sorted()
        let sortedOther = other.sorted()
        return sortedSelf == sortedOther
    }
}

// If your type conforms to Equatable
extension Array where Element: Equatable {
    func fuzzyMatches(other: Array) -> Bool {
        guard self.count == other.count else {
            return false
        }
        
        var selfCopy = self
        
        for item in other {
            if let index = selfCopy.firstIndex(of: item) {
                selfCopy.remove(at: index)
            } else {
                return false
            }
        }
        
        return false
    }
}
