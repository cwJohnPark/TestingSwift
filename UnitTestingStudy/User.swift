//
//  User.swift
//  UnitTestingStudy
//
//  Created by Chang-Won Park on 2020/10/13.
//  Copyright © 2020 John Park. All rights reserved.
//
import Foundation

struct User {
    static let upgradeNotification = Notification.Name("UserUpgraded")
    
    func upgrade() {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 1)
            let center = NotificationCenter.default
            center.post(name: User.upgradeNotification, object: nil, userInfo: ["level" : "gold"])
        }
    }
    
    func upgrade(using center: NotificationCenter) {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 1)
            center.post(name: User.upgradeNotification, object: nil, userInfo: ["level": "gold"])
        }
    }
}
