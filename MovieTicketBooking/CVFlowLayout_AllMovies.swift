//
//  CVFlowLayout_AllMovies.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 3.09.2023.
//

import UIKit

class CVFlowLayout_AllMovies: UICollectionViewFlowLayout {
    var columnCount = 2
    var heightRatio: CGFloat = 4 / 3
    
    init(minimumInteritemSpacing: Double = 10, minimumLineSpacing: Double = 5) {
        super.init()
        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.minimumLineSpacing = minimumLineSpacing
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }
        let spacings = collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(columnCount - 1)
        let itemWidth = (collectionView.bounds.width - spacings) / CGFloat(columnCount)
        let itemHeight = itemWidth * heightRatio + 75
        itemSize = CGSize(width: itemWidth, height: itemHeight)
    }
}
