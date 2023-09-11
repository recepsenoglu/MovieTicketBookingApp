//
//  Extension+String.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 11.09.2023.
//

import Foundation

extension String {
    func toDate()->Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.date(from: self)!
    }
}
