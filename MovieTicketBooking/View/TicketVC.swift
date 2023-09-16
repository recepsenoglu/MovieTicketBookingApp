//
//  VC_Ticket.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 6.09.2023.
//

import UIKit

final class TicketVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var seatsLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    @IBOutlet weak private var timeLabel: UILabel!
    @IBOutlet weak private var priceLabel: UILabel!
    
    // MARK: - Variables
    
    var ticket: Ticket?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTicket()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Functions
    
    private func initTicket() {
        guard let ticket = ticket else { return }
        titleLabel.text = ticket.movie.title
        seatsLabel.text = ticket.seatCodes()
        dateLabel.text = ticket.session.date.toString()
        timeLabel.text = ticket.session.time
        priceLabel.text = String(ticket.price)
    }
        
    // MARK: - Outlets
    
    @IBAction func btnGoHome_TUI(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
