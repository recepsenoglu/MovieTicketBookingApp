//
//  CVCell_UpcomingMovie.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 2.09.2023.
//

import UIKit

class CVCell_UpcomingMovie: UICollectionViewCell {
    // MARK: - Outlets
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    
    // MARK: - Variables
    public var onTap: ()->() = {
        print("Clicked")
    }
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(callFunction)))
    }
    
    // MARK: - Functions
    @objc func callFunction() {
        onTap()
    }

}
