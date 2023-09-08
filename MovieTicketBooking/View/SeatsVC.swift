//
//  VC_Seats.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 5.09.2023.
//

import UIKit

class SeatsVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var cvSeats: UICollectionView!
    @IBOutlet weak var lblDateAndTime: UILabel!
    @IBOutlet weak var lblSelectedSeats: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblTickets: UILabel!
    
    // MARK: - Variables
    public var movie: Movie?
    public var day: Day?
    public var hour: String?
    private var seats: [Seat] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cvSeats.register(UINib(nibName: "CVCell_Seat", bundle: nil), forCellWithReuseIdentifier: "CVCell_Seat")
        cvSeats.collectionViewLayout = CVFlowLayout_Seats()
        initSeats()
        initSession()

    }
    
    // MARK: - Functions
    func initSeats() {
        for section in 0..<9 {
            let sectionLength = section == 0 ? 5 : section == 1 ? 7 : 9
            for seatNumber in 0..<sectionLength {
                let seat = Seat(coord: SeatCoord(section: section, number: seatNumber))
                seats.append(seat)
            }
        }
    }
    
    func initSession() {
        guard let day = day, let hour = hour else { return }
        let dayNumber = day.getDay()
        let month = day.getMonth()
        lblDateAndTime.text = "\(dayNumber) \(month) - \(hour)"
    }
    
    func setSelectedSeats() {
        lblSelectedSeats.text = getSelectedSeatCodes()
    }
    
    func setPrice(_ price: Double) {
        lblPrice.text = String(price)
    }
    
    func setTickets(_ tickets: Int) {
        lblTickets.text = String(tickets)
    }
    
    func getSelectedSeats()->[Seat] {
        return seats.filter({ $0.selected })
    }
    
    func getSelectedSeatCodes()->String {
        let selectedSeatCodes = getSelectedSeats().map({seat in seat.seatCode() })
        return selectedSeatCodes.joined(separator: ", ")
    }
    
    func getTotalPrice()->Double {
        let seatCount: Int = getSelectedSeats().count
        return Double(seatCount) * 20.0
    }
    
    func getSeatIndex(_ indexPath: IndexPath)-> Int {
        let section = indexPath.section
        let row = indexPath.row
        let difference = section > 1 ? 6 : section > 0 ? 4 : 0
        
        return (section) * 9 + row - difference
    }
    
    func seatOnTap(_ index: Int) {
        if getSelectedSeats().count >= 10 {
            self.showToast(message: "You can not buy more than 10 tickets")
            return
        }
        seats[index].coord.printCoords()
        seats[index].selected = !seats[index].selected
        let seatCount: Int = getSelectedSeats().count
        let price: Double = getTotalPrice()
        setTickets(seatCount)
        setPrice(price)
        setSelectedSeats()
        cvSeats.reloadData()
    }
    
    func buyTickets() {
        if getSelectedSeats().count == 0 {
            self.showToast(message: "Please choose at least 1 seat")
        } else {
            let vcTicket = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TicketVC") as! TicketVC
            vcTicket.movie = movie
            vcTicket.day = day
            vcTicket.hour = hour
            vcTicket.seats = getSelectedSeatCodes()
            vcTicket.price = getTotalPrice()
            navigationController?.pushViewController(vcTicket, animated: true)
        }
    }
    
    // MARK: - Actions
    @IBAction func btnBuyTickets_TUI(_ sender: Any) {
        buyTickets()
    }
    
}

extension SeatsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 9
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seats.filter({seat in
            return seat.coord.section == section
        }).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let seat: Seat = seats[getSeatIndex(indexPath)]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell_Seat", for: indexPath) as! CVCell_Seat
        cell.setSeatAttributes(seat)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        seatOnTap(getSeatIndex(indexPath))
    }
}
