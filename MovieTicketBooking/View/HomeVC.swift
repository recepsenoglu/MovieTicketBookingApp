//
//  VC_Home.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 1.09.2023.
//

import UIKit

final class HomeVC: UIViewController {
    // MARK: - Outlets
    
    @IBOutlet weak private var moviesHeader: MovieSlideHeader!
    @IBOutlet weak private var moviesCV: UICollectionView!
    @IBOutlet weak var upcomingMoviesHeader: MovieSlideHeader!
    @IBOutlet weak private var upcomingMoviesCV: UICollectionView!
    
    // MARK: - Variables
    
    private var movies: [Movie] = []
    private var upcomingMovies: [Movie] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMoviesCV()
        setupUpcomingMoviesCV()
        setupHeaders()
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
    
    private func setupHeaders() {
        moviesHeader.configureView(title: "Now Showing", onPressed: {self.goToMovies()})
        upcomingMoviesHeader.configureView(title: "Upcoming", onPressed: {self.goToMovies(ShowType.Upcoming)})
    }
    
    private func setupMoviesCV() {
        moviesCV.register(UINib(nibName: "MoviePosterCVC", bundle: nil), forCellWithReuseIdentifier: "MoviePosterCVC")
        moviesCV.collectionViewLayout = MoviePostersLayout()
    }
    
    private func setupUpcomingMoviesCV() {
        upcomingMoviesCV.register(UINib(nibName: "UpcomingMoviePosterCVC", bundle: nil), forCellWithReuseIdentifier: "UpcomingMoviePosterCVC")
        upcomingMoviesCV.collectionViewLayout = MoviePostersLayout(bottomHeight: 35, imageAspectRatio: 1)
    }
    
    private func loadMovies() {
        let theBatmanMovie = Movie(imageAssetName: "TheBatman", title: "The Batman (2022)", filmReview: "When a sadistic serial killer begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.", releaseDate: "04/03/2022".toDate(), duration: 176, genres: [Genre.Action, Genre.Crime], contentRating: ContentRating.PG13, director: "Matt Reeves", cast: [ "Robert Pattinson", "Zoë Kravitz", "Jeffrey Wright", "Colin Farrell", "Paul Dano"], star: 4)
        movies.append(contentsOf: [theBatmanMovie, theBatmanMovie, theBatmanMovie, theBatmanMovie])
    }
    
    private func loadUpcomingMovies() {
        upcomingMovies.append(contentsOf: movies)
    }
    
    private func goToMovies(_ showType: ShowType = ShowType.NowShowing) {
        let moviesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MoviesVC") as! MoviesVC
        moviesVC.showType = showType
        moviesVC.movies = movies
        moviesVC.upcomingMovies = upcomingMovies
        navigationController?.pushViewController(moviesVC, animated: true)
    }
    
    private func goToMovieDetail(_ movie: Movie) {
        let movieDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailVC") as! MovieDetailVC
        movieDetailVC.movie = movie
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { collectionView == moviesCV ? movies.count : upcomingMovies.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let upcomingMovie: Bool = collectionView == upcomingMoviesCV
        let movie: Movie = upcomingMovie ? movies[indexPath.row] : upcomingMovies[indexPath.row]
        if upcomingMovie {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpcomingMoviePosterCVC", for: indexPath) as! UpcomingMoviePosterCVC
            cell.setupCell(movie)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviePosterCVC", for: indexPath) as! MoviePosterCVC
            cell.setupCell(movie)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = collectionView == moviesCV ? movies[indexPath.row] : upcomingMovies[indexPath.row]
        goToMovieDetail(movie)
    }
}
