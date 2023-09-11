//
//  CVCell_Seat.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 5.09.2023.
//

import UIKit

class SeatCVC: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var imageIV: UIImageView!
        
    func setupCell(_ seat: Seat) {
        let imageName = seat.sold || seat.selected ? "chair.lounge.fill" : "chair.lounge"
        imageIV.image = UIImage(systemName: imageName)
        imageIV.tintColor = seat.selected ? UIColor.systemGreen : UIColor.black
    }
}
