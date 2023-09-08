//
//  VC_Ticket.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 6.09.2023.
//

import UIKit

final class TicketVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var lblSeats: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    // MARK: - Variables
    var movie: Movie?
    var seats: String?
    var day: Day?
    var hour: String?
    var price: Double?
    
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
    func initTicket() {
        lblMovieTitle.text = movie?.title
        lblSeats.text = seats
        lblDate.text = day?.getDateString()
        lblTime.text = hour
        lblPrice.text = String(price ?? 0.0)
    }
    
    func goHomeView() {
        let vcHome = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeVC") as! HomeVC
        navigationController?.pushViewController(vcHome, animated: true)
    }
    
    // MARK: - Outlets
    @IBAction func btnGoHome_TUI(_ sender: Any) {
        goHomeView()
    }
}
