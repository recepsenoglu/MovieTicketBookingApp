//
//  CVFlowLayout_Onboarding.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 1.09.2023.
//

import UIKit

class OnboardingFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        scrollDirection = .horizontal
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }
        itemSize = collectionView.bounds.size
    }
}
