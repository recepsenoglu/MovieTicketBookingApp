//
//  CVFlowLayout_Movies.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 2.09.2023.
//

import UIKit

class CVFlowLayout_Movies: UICollectionViewFlowLayout {
    var titleHeight: Double
    var customInteritemSpacing: CGFloat = 10
    var aspectRatio: Double = 3 / 4

    init(titleHeight: Double = 55, imageAspectRatio aspectRatio: Double = 3/4) {
        self.titleHeight = titleHeight
        self.aspectRatio = aspectRatio
        super.init()
        scrollDirection = .horizontal
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }
        let itemHeight = collectionView.bounds.size.height
        let imageHeight = itemHeight > titleHeight ? itemHeight - titleHeight : itemHeight
        let itemWidth = imageHeight * aspectRatio
        itemSize = CGSize(width: itemWidth, height: itemHeight)
        minimumInteritemSpacing = customInteritemSpacing
    }
}
