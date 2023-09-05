//
//  CVCell_Day.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 4.09.2023.
//

import UIKit

class CVCell_Day: UICollectionViewCell {
    // MARK: - Outlets
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var lblMonth: UILabel!
    @IBOutlet weak var lblDay: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: Functions
    func selectDay() {
        self.viewBackground.backgroundColor = UIColor(named: "PrimaryColor")!
        self.lblMonth.textColor = UIColor.white
        self.lblDay.textColor = UIColor.white
    }
    
    func unSelectDay() {
        self.viewBackground.backgroundColor = UIColor.systemBackground
        self.lblMonth.textColor = UIColor.black
        self.lblDay.textColor = UIColor.black
    }

}
