//
//  Extension+UIView.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 15.09.2023.
//

import Foundation
import UIKit

extension UIView {
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self).first as? UIView
    }
}
