//
//  Ticket.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 11.09.2023.
//

import Foundation

struct Ticket {
    static var tickets: [Ticket] = []
    
    var movie: Movie
    var session: Session
    var seats: [Seat]
    var price: Double
    
    func seatCodes() -> String {
        return seats.map({seat in seat.seatCode}).joined(separator: ", ")
    }
    
    static func soldSeats(movie: Movie, session: Session) -> [Seat] {
        let filteredTickets = tickets.filter({ ticket in
            return ticket.movie.isIdentical(movie) && ticket.session.isIdentical(session)
        })
        return filteredTickets.map({ticket in ticket.seats }).flatMap{ $0 }
    }
    
    init(movie: Movie, session: Session, seats: [Seat], price: Double) {
        self.movie = movie
        self.session = session
        self.seats = seats
        self.price = price
        Ticket.tickets.append(self)
    }
}
