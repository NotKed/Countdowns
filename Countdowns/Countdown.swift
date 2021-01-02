//
//  Countdown.swift
//  Countdowns
//
//  Created by Kyle Edwards on 02/01/2021.
//

import Foundation
import CoreData

class Countdown {
    var name: String?
    var date: Date?
    init(name: String, date: Date) {
        self.name = name
        self.date = date
    }
}
