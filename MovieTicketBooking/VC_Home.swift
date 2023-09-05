//
//  VC_Home.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 1.09.2023.
//

import UIKit

final class VC_Home: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var cvMovies: UICollectionView!
    @IBOutlet weak var cvUpcomingMovies: UICollectionView!
    
    // MARK: - Variables
    private var movies: [Movie] = []
    private var upcomingMovies: [Movie] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cvMovies.register(UINib(nibName: "CVCell_Movie", bundle: nil), forCellWithReuseIdentifier: "CVCell_Movie")
        cvMovies.collectionViewLayout = CVFlowLayout_Movies()
        cvUpcomingMovies.register(UINib(nibName: "CVCell_UpcomingMovie", bundle: nil), forCellWithReuseIdentifier: "CVCell_UpcomingMovie")
        cvUpcomingMovies.collectionViewLayout = CVFlowLayout_Movies(titleHeight: 35, imageAspectRatio: 1)
        loadMovies()
        loadUpcomingMovies()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    // MARK: - Functions
    func loadMovies() {
        var theBatmanMovie = Movie(imageAssetName: "TheBatman", title: "The Batman (2022)", filmReview: "When a sadistic serial killer begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.", releaseDate: "04/03/2022".toDate(), duration: 176, genres: [Genre.Action, Genre.Crime], contentRating: ContentRating.PG13, director: "Matt Reeves", cast: [ "Robert Pattinson", "Zoë Kravitz", "Jeffrey Wright", "Colin Farrell", "Paul Dano"], star: 4)
        
        movies.append(contentsOf: [theBatmanMovie, theBatmanMovie, theBatmanMovie, theBatmanMovie])
        theBatmanMovie.title = "Showin"
        movies.insert(theBatmanMovie, at: 0)
    }
    
    func loadUpcomingMovies() {
        var movie = movies[0]
        movie.title = "Upcomin"
        upcomingMovies.append(movie)
        upcomingMovies.append(contentsOf: movies)
    }
    
    func goToAllMovies(_ showType: ShowType = ShowType.NowShowing) {
        let vcAllMovies = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "VC_AllMovies") as! VC_AllMovies
        vcAllMovies.showType = showType
        vcAllMovies.movies = movies
        vcAllMovies.upcomingMovies = upcomingMovies
        navigationController?.pushViewController(vcAllMovies, animated: true)
//        present(vcAllMovies, animated: true)
    }
    
    func goToMovieDetail(_ movie: Movie) {
        let vcMovieDetail = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC_MovieDetail") as! VC_MovieDetail
        vcMovieDetail.movie = movie
        navigationController?.pushViewController(vcMovieDetail, animated: true)
    }
    
    // MARK: - Actions
    @IBAction func btnAllMovies_TUI(_ sender: Any) {
        goToAllMovies()
    }
    
    @IBAction func btnAllUpcomingMovies_TUI(_ sender: Any) {
        goToAllMovies(ShowType.Upcoming)
    }
}

extension VC_Home: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == cvMovies {
            return movies.count
        }
        return upcomingMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == cvMovies {
            let movie: Movie = movies[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell_Movie", for: indexPath) as! CVCell_Movie
            cell.ivImage.image = movie.image
            cell.lblTitle.text = movie.title
            cell.setStars(movie.star)
            cell.onTap = {
                self.goToMovieDetail(movie)
            }
            return cell
        } else {
            let movie = upcomingMovies[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell_UpcomingMovie", for: indexPath) as! CVCell_UpcomingMovie
            cell.ivImage.image = movie.image
            cell.lblTitle.text = movie.title
            cell.lblDirector.text = movie.director
            cell.onTap = {
                self.goToMovieDetail(movie)
            }
            return cell
        }
    }
}
