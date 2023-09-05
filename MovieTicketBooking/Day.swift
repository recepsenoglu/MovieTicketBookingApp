//
//  Day.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 4.09.2023.
//

import Foundation

struct Day {
    var date: Date
    
    init(date: Date) {
        self.date = date
    }
    
    func getMonth()->String {
        return date.getMonth()
    }
    
    func getDay()->String {
        return String(date.getDay())
    }
    
    func isIdentical(_ otherDay: Day)->Bool {
        return date.toString() == otherDay.date.toString()
    }
}


