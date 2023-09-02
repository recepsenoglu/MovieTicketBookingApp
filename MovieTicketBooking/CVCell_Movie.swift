//
//  CVCell_Movie.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 2.09.2023.
//

import UIKit

class CVCell_Movie: UICollectionViewCell {
    // MARK: - Outlets
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var ivStar0: UIImageView!
    @IBOutlet weak var ivStar1: UIImageView!
    @IBOutlet weak var ivStar2: UIImageView!
    @IBOutlet weak var ivStar3: UIImageView!
    @IBOutlet weak var ivStar4: UIImageView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Functions
    func setStars(_ star: Int) {
        for i in 0..<star {
            let keyPath = "ivStar\(i)"
            if let imageView = self.value(forKey: keyPath) as? UIImageView {
                let image = UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate)
                imageView.image = image
                imageView.tintColor = .systemYellow
            }
        }
    }
}
