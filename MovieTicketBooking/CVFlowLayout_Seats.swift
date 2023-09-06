//
//  CVFlowLayout_Seats.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 5.09.2023.
//

import UIKit

class CVFlowLayout_Seats: UICollectionViewFlowLayout {
    init(minimumInteritemSpacing: Double = 5, minimumLineSpacing: Double = 5) {
        super.init()
        self.minimumInteritemSpacing = CGFloat(minimumInteritemSpacing)
        self.minimumLineSpacing = CGFloat(minimumLineSpacing)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let collectionView = collectionView else { return nil }
        
        var allAttributes: [UICollectionViewLayoutAttributes] = []
        
        for section in 0..<collectionView.numberOfSections {
            for item in 0..<collectionView.numberOfItems(inSection: section) {
                let indexPath = IndexPath(item: item, section: section)
                if let attributes = layoutAttributesForItem(at: indexPath) {
                    allAttributes.append(attributes)
                }
            }
        }
        
        return allAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let collectionView = collectionView else { return nil }
        
        let attributes = super.layoutAttributesForItem(at: indexPath)?.copy() as!UICollectionViewLayoutAttributes
        
        let sectionItemCount = collectionView.numberOfItems(inSection: indexPath.section)
        let totalItemWidth = CGFloat(sectionItemCount) * itemSize.width
        let totalSpacingWidth = CGFloat(sectionItemCount - 1) * minimumInteritemSpacing
        let xOffset = (collectionView.bounds.width - totalItemWidth - totalSpacingWidth) / 2.0
        let sectionNumber = CGFloat(indexPath.section)
        attributes.frame.origin.x += xOffset
        attributes.frame.origin.y += minimumLineSpacing * sectionNumber
        
        return attributes
    }
    

    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        itemSize = CGSize(width: 30, height: 30)
    }
}
