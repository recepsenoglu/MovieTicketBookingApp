//
//  Slide.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 1.09.2023.
//

import Foundation
import UIKit

struct OnboardingSlide{
    var image: UIImage?
    var title: String
    var text: String
    
    init(image imageName: String, title: String, text: String) {
        self.image = UIImage(named: imageName)
        self.title = title
        self.text = text
    }
}
