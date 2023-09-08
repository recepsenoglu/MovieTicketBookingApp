//
//  CVCell_Onboarding.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 1.09.2023.
//

import UIKit

class OnboardingCVC: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var imageIV: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    // MARK: - Functions
    
    func setupCell(_ slide: OnboardingSlide) {
        imageIV.image = slide.image
        titleLabel.text = slide.title
        textLabel.text = slide.text
    }
}
