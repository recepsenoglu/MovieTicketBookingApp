//
//  MoviePosterCVC.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 8.09.2023.
//

import UIKit

class MoviePosterCVC: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak private var imageIV: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var starsView: UIView!
    @IBOutlet weak private var star0IV: UIImageView!
    @IBOutlet weak private var star1IV: UIImageView!
    @IBOutlet weak private var star2IV: UIImageView!
    @IBOutlet weak private var star3IV: UIImageView!
    @IBOutlet weak private var star4IV: UIImageView!
    
    // MARK: - Functions
    func setupCell(_ movie: Movie) {
        imageIV.image = movie.image
        titleLabel.text = movie.title
        setStars(movie.star)
    }
    
    func setStars(_ star: Int) {
        for i in 0..<star {
            let keyPath = "star\(i)IV"
            if let imageView = self.value(forKey: keyPath) as? UIImageView {
                let image = UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate)
                imageView.image = image
                imageView.tintColor = .systemYellow
            }
        }
    }
}
