//
//  VC_AllMovies.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 3.09.2023.
//

import UIKit

enum ShowType: Int {
    case NowShowing = 0
    case Upcoming = 1
}

final class VC_AllMovies: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var scShowType: UISegmentedControl!
    @IBOutlet weak var cvMovies: UICollectionView!
    
    // MARK: - Variables
    public var showType: ShowType = ShowType.NowShowing
    public var movies: [Movie] = []
    public var upcomingMovies: [Movie] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        scShowType.selectedSegmentIndex = getShowTypeIndex()
        cvMovies.register(UINib(nibName: "CVCell_Movie2", bundle: nil), forCellWithReuseIdentifier: "CVCell_Movie2")
        cvMovies.collectionViewLayout = CVFlowLayout_AllMovies()
        navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - Functions
    func getShowTypeIndex() -> Int {
        return showType.rawValue
    }
    
    func goToMovieDetails(_ movie: Movie) {
        let vcMovieDetail = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC_MovieDetail") as! VC_MovieDetail
        vcMovieDetail.movie = movie
        navigationController?.pushViewController(vcMovieDetail, animated: true)
    }
    
    // MARK: - Actions
    @IBAction func scShowType_ValueChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        showType = index == 0 ? ShowType.NowShowing : ShowType.Upcoming
        cvMovies.reloadData()
    }
}

extension VC_AllMovies: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if showType == ShowType.NowShowing {
            return movies.count
        }
        return upcomingMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell_Movie2", for: indexPath) as! CVCell_Movie2
        let movie: Movie
        let index = indexPath.row
        if showType == ShowType.NowShowing {
            movie = movies[index]
            cell.lblDuration.text = movie.durationString()
            cell.lblDuration.isHidden = false
            cell.viewDate.isHidden = true
        } else {
            movie = upcomingMovies[index]
            cell.lblReleaseDate.text = movie.releaseDateString()
            cell.viewDate.isHidden = false
            cell.lblDuration.isHidden = true
        }
        cell.ivImage.image = movie.image
        cell.lblTitle.text = movie.title
        cell.lblGenres.text = movie.genresString()
        cell.onTap = {
            self.goToMovieDetails(movie)
        }
        return cell
    }
    
    
}
