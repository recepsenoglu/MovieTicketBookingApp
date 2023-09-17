//
//  SeatsVC.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 5.09.2023.
//

import UIKit

final class SeatsVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var seatsCV: UICollectionView!
    @IBOutlet weak private var sessionLabel: UILabel!
    @IBOutlet weak private var selectedSeatsLabel: UILabel!
    @IBOutlet weak private var priceLabel: UILabel!
    @IBOutlet weak private var ticketsLabel: UILabel!
    
    // MARK: - Variables
    
    var movie: Movie?
    var session: Session?
    private var seats: [Seat] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSeats()
        sessionLabel.text = session?.toString()
        seatsCV.setup("SeatCVC", SeatsFlowLayout())
    }
    
    // MARK: - Functions
    
    private func createSeats() {
        guard let movie = movie, let session = session else { return }
        let soldSeats: [Seat] = Ticket.soldSeats(movie: movie, session: session)
        for section in 0..<9 {
            let sectionLength = section == 0 ? 5 : section == 1 ? 7 : 9
            for row in 0..<sectionLength {
                var seat = Seat(section, row)
                if soldSeats.contains(where: { soldSeat in soldSeat.isIdentical(seat) }) {
                    seat.sold = true
                }
                seats.append(seat)
            }
        }
    }
    
    private func selectedSeats() -> [Seat] { seats.filter({ $0.selected }) }
    
    private func selectedSeatsCount() -> Int { selectedSeats().count }
    
    private func selectedSeatsCodes() -> String {
        let selectedSeatCodes = selectedSeats().map({seat in seat.seatCode })
        return selectedSeatCodes.joined(separator: ", ")
    }
    
    private func calculateTotalPrice() -> Double { Double(selectedSeatsCount()) * 20.0 }
        
    private func seatIndexOf(_ indexPath: IndexPath)-> Int {
        let section = indexPath.section
        let row = indexPath.row
        let difference = section > 1 ? 6 : section > 0 ? 4 : 0
        return (section) * 9 + row - difference
    }
    
    private func seatOnTap(_ index: Int) {
        guard seats[index].sold != true else { return }
        let isSelected = seats[index].selected
        guard selectedSeatsCount() < 10 || isSelected else {
            self.showToast("You can not buy more than 10 tickets")
            return
        }
        seats[index].selected = !isSelected
        seatsCV.reloadData()
        ticketsLabel.text = String(selectedSeatsCount())
        selectedSeatsLabel.text = selectedSeatsCodes()
        priceLabel.text = calculateTotalPrice().toString()
    }
    
    // MARK: - Actions
    
    @IBAction private func btnBuyTickets_TUI(_ sender: Any) {
        guard selectedSeatsCount() > 0 else {
            self.showToast("Please choose at least 1 seat")
            return
        }
        let ticketVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TicketVC") as! TicketVC
        let ticket = Ticket(movie: movie!, session: session!, seats: selectedSeats(), price: calculateTotalPrice())
        ticketVC.ticket = ticket
        navigationController?.pushViewController(ticketVC, animated: true)
    }
}

extension SeatsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { 9 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seats.filter({seat in seat.section == section }).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeatCVC", for: indexPath) as! SeatCVC
        let seat: Seat = seats[seatIndexOf(indexPath)]
        cell.setupCell(seat)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        seatOnTap(seatIndexOf(indexPath))
    }
}
