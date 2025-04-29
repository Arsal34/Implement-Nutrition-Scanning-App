//
//  DateUtility.swift
//  Nutrak
//
//  Created by M1 on 29/04/25.
//

import Foundation


extension Date {
    func formatted(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

func last7DaysStreaks(endingOn endDate: Date = Date()) -> [StreakModel] {
    (0..<7).reversed().map { offset in
        let date = Calendar.current.date(byAdding: .day, value: -offset, to: endDate)!
        let isStreak = Bool.random() 
        return StreakModel(date: date, isStreak: isStreak)
    }
}
