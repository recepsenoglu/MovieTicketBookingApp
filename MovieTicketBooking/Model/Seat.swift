//
//  Seat.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 5.09.2023.
//

import Foundation

struct Seat {
    var selected: Bool
    var sold: Bool
    var coord: SeatCoord
    var id: String { get { "(\(coord.section),\(coord.number))" } }
    
    init(selected: Bool = false, sold: Bool = false, coord: SeatCoord) {
        self.selected = selected
        self.sold = sold
        self.coord = coord
    }
    
    func isEqual(_ seat: Seat)->Bool { seat.id == self.id }
    
    func seatCode() -> String { "\(sectionLetters[self.coord.section])\(self.coord.number + 1)" }
}

struct SeatCoord {
    var section: Int
    var number: Int
    
    init(section: Int, number: Int) {
        self.section = section
        self.number = number
    }
    
    func printCoords(){
        print("section: \(section)\nindex: \(number)")
    }
}

var sectionLetters = ["A", "B", "C", "D", "E", "F", "G", "H", "J"]
