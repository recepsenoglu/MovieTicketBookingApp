//
//  VC_MovieDetail.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 3.09.2023.
//

import UIKit

class VC_MovieDetail: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblContentRating: UILabel!
    @IBOutlet weak var lblFilmReview: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblCast: UILabel!
    
    // MARK: - Variables
    public var movie: Movie?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initMovie()
    }
        
    // MARK: - Functions
    func initMovie() {
        guard movie != nil else { return }
        ivImage.image = movie!.image
        lblTitle.text = movie!.title
        lblReleaseDate.text = movie!.releaseDateString()
        lblGenre.text = movie!.genresString()
        lblDuration.text = movie!.durationString()
        lblContentRating.text = movie!.contentRating.rawValue
        lblFilmReview.text = movie!.filmReview
        lblDirector.text = movie!.director
        lblCast.text = movie!.getCast()
    }
    
    func goToSessionView(_ movie: Movie) {
        let vcSession = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC_Session") as! VC_Session
        vcSession.movie = movie
        navigationController?.pushViewController(vcSession, animated: true)
    }
    
    @IBAction func btnBookTickets_TUI(_ sender: Any) {
        guard movie != nil else { return }
        goToSessionView(movie!)
    }
}
