//
//  Seat.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 5.09.2023.
//

import Foundation

struct Seat {
    var section: Int
    var row: Int
    var selected: Bool
    var sold: Bool
    var seatCode: String { get { "\(["A", "B", "C", "D", "E", "F", "G", "H", "J"][section])\(row + 1)" } }
    
    func isIdentical(_ otherSeat: Seat) -> Bool { seatCode == otherSeat.seatCode }

    init(_ section: Int, _ row: Int, selected: Bool = false, sold: Bool = false) {
        self.section = section
        self.row = row
        self.selected = selected
        self.sold = sold
    }
}
