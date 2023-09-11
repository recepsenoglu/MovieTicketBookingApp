//
//  Session.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 9.09.2023.
//

import Foundation

struct Session {
    var date: Date
    var id: String { get { date.toString("dd.MM.yyyy HH:mm") } }
    var month: String { get { date.month() } }
    var day: String { get { String(date.day()) } }
    var time: String {
        get { return date.time() }
        set {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy HH:mm"
            let newDate = formatter.date(from: "\(date.toString()) \(newValue)")
            date = newDate ?? date
        }
    }
    
    func isIdentical(_ session: Session?) -> Bool { id == session?.id }
    
    init(date: Date) { self.date = date }
}
