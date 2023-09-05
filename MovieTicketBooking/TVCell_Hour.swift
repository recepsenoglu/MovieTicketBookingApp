//
//  TVCell_Hour.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 5.09.2023.
//

import UIKit

class TVCell_Hour: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var lblHour: UILabel!
    @IBOutlet weak var ivSelected: UIImageView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Functions
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        ivSelected.isHidden = !selected
    }
    
}
