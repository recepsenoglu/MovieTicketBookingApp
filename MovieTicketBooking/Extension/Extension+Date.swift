//
//  Extension+Date.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 11.09.2023.
//

import Foundation

extension Date {

    func toString(_ format: String = "dd.MM.yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func time() -> String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: self)
        let minute = calendar.component(.minute, from: self)
        return "\(hour.formatSingleDigitNumber()):\(minute.formatSingleDigitNumber())"
    }
    
    func month() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        return formatter.string(from: self)
    }
    
    func day() -> Int {
        let calendar = Calendar.current
        return calendar.component(.day, from: self)
    }
    
    func futureDate(daysToAdd: Int) -> Date {
        let today = Date()
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: daysToAdd, to: today) ?? today
    }
    
    func isSameDate(_ other: Date) -> Bool {
        return self.toString() == other.toString()
    }
}
