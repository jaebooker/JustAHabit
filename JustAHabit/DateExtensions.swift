//
//  DateExtensions.swift
//  JustAHabit
//
//  Created by Jaeson Booker on 11/16/18.
//  Copyright © 2018 Jaeson Booker. All rights reserved.
//

import Foundation

extension Date {
    var stringValue: String {
        return DateFormatter.localizedString(from: self, dateStyle: .medium, timeStyle: .none)
    }
    var isToday: Bool {
        let calender = Calendar.current
        return calender.isDateInToday(self)
    }
    var isYesterday: Bool {
        let calender = Calendar.current
        return calender.isDateInYesterday(self)
    }
}
