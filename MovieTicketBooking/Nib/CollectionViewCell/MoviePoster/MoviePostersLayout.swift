//
//  CVFlowLayout_Movies.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 2.09.2023.
//

import UIKit

class MoviePostersLayout: UICollectionViewFlowLayout {
    private var bottomHeight: Double
    private var customInteritemSpacing: CGFloat = 10
    private var aspectRatio: Double = 3 / 4

    init(bottomHeight: Double = 45, imageAspectRatio aspectRatio: Double = 3/4) {
        self.bottomHeight = bottomHeight
        self.aspectRatio = aspectRatio
        super.init()
        scrollDirection = .horizontal
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let collectionView = collectionView else { return nil }
        var allAttributes: [UICollectionViewLayoutAttributes] = []
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            if let attributes = layoutAttributesForItem(at: indexPath) {
                allAttributes.append(attributes)
            }
        }
        return allAttributes
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = super.layoutAttributesForItem(at: indexPath)?.copy() as!UICollectionViewLayoutAttributes
        attributes.frame.origin.x += 20.0
        return attributes
    }
    
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }
        let itemHeight = collectionView.bounds.size.height
        let imageHeight = itemHeight > bottomHeight ? itemHeight - bottomHeight : itemHeight
        let itemWidth = imageHeight * aspectRatio
        itemSize = CGSize(width: itemWidth, height: itemHeight)
        minimumInteritemSpacing = customInteritemSpacing
    }
}
