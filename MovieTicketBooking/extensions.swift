//
//  extensions.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 4.09.2023.
//

import Foundation

extension String {
    func toDate()->Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.date(from: self)!
    }
}

extension Date {
    func toString()->String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: self)
    }
    
    func getMonth()->String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        return formatter.string(from: self)
    }
    
    func getDay()->Int {
        let calendar = Calendar.current
        return calendar.component(.day, from: self)
    }
    
    func getDayName()-> String {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: self)
        return days[weekday-1]
    }
    
    func futureDate(daysToAdd: Int)->Date {
        let today = Date()
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: daysToAdd, to: today)!
    }
}

let days: [String] = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
