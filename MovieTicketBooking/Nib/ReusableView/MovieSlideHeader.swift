//
//  MovieSlideTitle.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 13.09.2023.
//

import UIKit

@IBDesignable
final class MovieSlideHeader: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var titleLabel: UILabel!
    
    // MARK: - Variables
    
    var onPressed: (() -> Void)?
    
    // MARK: - Overrides
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    // MARK: - Functions
    
    private func commonInit() {
        guard let view = self.loadViewFromNib(nibName: "MovieSlideHeader") else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }
    
    func configureView(title: String, onPressed: (() -> Void)?) {
        self.titleLabel.text = title
        self.onPressed = onPressed
    }
    
    // MARK: - Actions
    
    @IBAction func btnSeeAll_TUI(_ sender: Any) {
        onPressed?()
    }
}
