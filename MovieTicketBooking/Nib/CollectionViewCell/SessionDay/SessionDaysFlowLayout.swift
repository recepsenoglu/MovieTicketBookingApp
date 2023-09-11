//
//  CVFlowLayout_Days.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 4.09.2023.
//

import UIKit

class SessionDaysFlowLayout: UICollectionViewFlowLayout {
    
    init(minimumInteritemSpacing: CGFloat = 5) {
        super.init()
        scrollDirection = .horizontal
        self.minimumInteritemSpacing = minimumInteritemSpacing
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }
        let itemHeight = collectionView.bounds.height
        let itemWidth = itemHeight
        itemSize = CGSize(width: itemWidth, height: itemHeight)
    }
}
