//
//  TVCell_Hour.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 5.09.2023.
//

import UIKit

class SessionTimeTVC: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var timeLabel: UILabel!
    @IBOutlet weak private var selectedIV: UIImageView!
    
    // MARK: - Functions
    
    func setupCell(time: String) {
        timeLabel.text = time
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectedIV.isHidden = !selected
        timeLabel.font = .systemFont(ofSize: 18, weight: selected ? .medium : .regular)
    }
}
