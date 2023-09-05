//
//  CVFlowLayout_Days.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 4.09.2023.
//

import UIKit

class CVFlowLayout_Days: UICollectionViewFlowLayout {
    
    init(minimumInteritemSpacing: CGFloat = 5) {
        super.init()
        self.minimumInteritemSpacing = minimumInteritemSpacing
        scrollDirection = .horizontal
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }
        var itemHeight = collectionView.bounds.height
        var itemWidth = itemHeight
        itemSize = CGSize(width: itemWidth, height: itemHeight)
    }
}
