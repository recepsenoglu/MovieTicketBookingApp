//
//  Extension+Session.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 11.09.2023.
//

import Foundation

extension Session {
    func toString() -> String {
        return "\(self.day) \(self.month) - \(self.time)"
    }
}
