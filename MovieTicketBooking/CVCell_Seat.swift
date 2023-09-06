//
//  CVCell_Seat.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 5.09.2023.
//

import UIKit

class CVCell_Seat: UICollectionViewCell {
    // MARK: - Outlets
    @IBOutlet weak var ivImage: UIImageView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setSeatAttributes(_ seat: Seat) {
        ivImage.tintColor = seat.selected ? UIColor.systemGreen : UIColor.black
        let imageName = seat.sold || seat.selected ? "chair.lounge.fill" : "chair.lounge"
        ivImage.image = UIImage(systemName: imageName)
    }
}
