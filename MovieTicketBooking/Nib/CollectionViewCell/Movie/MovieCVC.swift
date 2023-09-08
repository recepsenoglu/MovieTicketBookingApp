//
//  CVCell_Movie2.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 3.09.2023.
//

import UIKit

class MovieCVC: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var imageIV: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var genresLabel: UILabel!
    @IBOutlet weak private var durationLabel: UILabel!
    @IBOutlet weak private var dateView: UIView!
    @IBOutlet weak private var releaseDateLabel: UILabel!
    
    // MARK: - Functions

    func setupCell(_ movie: Movie, showReleaseDate: Bool) {
        imageIV.image = movie.image
        titleLabel.text = movie.title
        genresLabel.text = movie.genresString()
        durationLabel.isHidden = showReleaseDate
        dateView.isHidden = !showReleaseDate
        if showReleaseDate {
            releaseDateLabel.text = movie.releaseDateString()
        } else {
            durationLabel.text = movie.durationString()
        }
    }
}
