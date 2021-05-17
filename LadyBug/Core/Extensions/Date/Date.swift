//
//  Date.swift
//  LadyBug
//
//  Created by SAMEH on 16/05/2021.
//

import Foundation

extension Date {
    static var parsingFormat = "yyyy-MM-dd hh:mm:ss"
    static var dateDisplayFormat = "yyyy-MM-dd"
}

extension Date {
    var toDisplayString: String? {
        
        let calendar = Calendar.current
        let localizer = DateLocalizer()
        
        if calendar.isDateInToday(self) {
            return localizer.today
        } else if calendar.isDateInTomorrow(self) {
            return localizer.tommorow
        } else if calendar.dateComponents([.day], from: calendar.startOfDay(for: Date()), to: calendar.startOfDay(for: self)).day ?? 0 == 2 {
            return localizer.afterTommorow
        } else {
            return self.toString
        }
    }
    
    var toString: String {
        let format = DateFormatter()
        format.dateFormat = Date.dateDisplayFormat
        format.locale = Locale.current
        format.timeZone = TimeZone.current
        return format.string(from: self)
    }
}
