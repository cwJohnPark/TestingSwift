//
//  NotificationTests.swift
//  UnitTestingStudyTests
//
//  Created by Chang-Won Park on 2020/10/13.
//  Copyright © 2020 John Park. All rights reserved.
//

import XCTest
@testable import UnitTestingStudy

class NotificationTests: XCTestCase {

    func testUserUpgradedPostNotification() {
        // given
        let user = User()
        let expectation = XCTNSNotificationExpectation(name: User.upgradeNotification)
    
        // when
        user.upgrade()
        
        // then
        wait(for: [expectation], timeout: 3)
    }
    
    func testUserUpgradedPostNotification_checkLevel() {
        // given
        let user = User()
        let expectation = XCTNSNotificationExpectation(name: User.upgradeNotification)
        
        expectation.handler = { notification in
            guard let level = notification.userInfo?["level"] as? String else {
                return false
            }
            
            if level == "gold" {
                return true
            } else {
                return false
            }
        }
        
        // when
        user.upgrade()
        
        // then
        wait(for: [expectation], timeout: 3)
    }

    func testUserUpgradedPostNotification_ownInstance() {
        // given
        let center = NotificationCenter()
        let user = User()
        let expectation = XCTNSNotificationExpectation(name: User.upgradeNotification, object: nil, notificationCenter: center)
        
        expectation.handler = { notification -> Bool in
            guard let level = notification.userInfo?["level"] as? String else {
                return false
            }
            
            if level == "gold" {
                return true
            } else {
                return false
            }
        }
        
        // when
        user.upgrade(using: center)
        
        // then
        wait(for: [expectation], timeout: 3)
        
    }
}
