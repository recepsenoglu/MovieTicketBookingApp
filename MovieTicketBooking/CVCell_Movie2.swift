//
//  CVCell_Movie2.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 3.09.2023.
//

import UIKit

class CVCell_Movie2: UICollectionViewCell {
    // MARK: - Outlets
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblGenres: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var viewDate: UIView!
    @IBOutlet weak var lblReleaseDate: UILabel!
    
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
