//
//  VC_MovieDetail.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 3.09.2023.
//

import UIKit

final class MovieDetailVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var imageIV: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var releaseDateLabel: UILabel!
    @IBOutlet weak private var genreLabel: UILabel!
    @IBOutlet weak private var durationLabel: UILabel!
    @IBOutlet weak private var contentRatingLabel: UILabel!
    @IBOutlet weak private var filmReviewLabel: UILabel!
    @IBOutlet weak private var directorLabel: UILabel!
    @IBOutlet weak private var castLabel: UILabel!
    
    // MARK: - Variables
    
    var movie: Movie?
    private var pageTitle: String?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageTitle = self.title
        fillMovieInformation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = pageTitle
    }
        
    // MARK: - Functions
    
    private func fillMovieInformation() {
        guard let movie else { return }
        imageIV.image = movie.image
        titleLabel.text = movie.title
        releaseDateLabel.text = movie.releaseDateString()
        genreLabel.text = movie.genresString()
        durationLabel.text = movie.durationString()
        contentRatingLabel.text = movie.contentRating.rawValue
        filmReviewLabel.text = movie.filmReview
        directorLabel.text = movie.director
        castLabel.attributedText = movie.castList()
    }
        
    // MARK: - Actions
    
    @IBAction private func btnBookTickets_TUI(_ sender: Any) {
        guard let movie else { return }
        let reservationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReservationVC") as! ReservationVC
        reservationVC.movie = movie
        navigationController?.pushViewController(reservationVC, animated: true)
    }
}
