//
//  Extension+Int.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 11.09.2023.
//

import Foundation

extension Int {
    func formatSingleDigitNumber() -> String {
        self < 10 ? "0\(self)" : "\(self)"
    }
}
