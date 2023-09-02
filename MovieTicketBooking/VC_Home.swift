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
    var movies: [Movie] = []
    var upcomingMovies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cvMovies.register(UINib(nibName: "CVCell_Movie", bundle: nil), forCellWithReuseIdentifier: "CVCell_Movie")
        cvMovies.collectionViewLayout = CVFlowLayout_Movies()
        cvUpcomingMovies.register(UINib(nibName: "CVCell_UpcomingMovie", bundle: nil), forCellWithReuseIdentifier: "CVCell_UpcomingMovie")
        cvUpcomingMovies.collectionViewLayout = CVFlowLayout_Movies(titleHeight: 35, imageAspectRatio: 1)
        loadMovies()
        loadUpcomingMovies()
    }
    
    // MARK: - Functions
    func loadMovies() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        let theBatmanMovie = Movie(imageAssetName: "TheBatman", title: "The Batman (2022)", description: "When a sadistic serial killer begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement.", showingDate: formatter.date(from: "2022/03/04")!, time: 176, genres: [Genre.Action, Genre.Crime], contentRating: ContentRating.PG13, director: "Matt Reeves", cast: [ "Robert Pattinson", "Zoë Kravitz", "Jeffrey Wright", "Colin Farrell", "Paul Dano"], star: 4)
        
        movies.append(contentsOf: [theBatmanMovie, theBatmanMovie, theBatmanMovie, theBatmanMovie])
    }
    
    func loadUpcomingMovies() {
        upcomingMovies.append(contentsOf: movies)
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
            return cell
        } else {
            let movie = upcomingMovies[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell_UpcomingMovie", for: indexPath) as! CVCell_UpcomingMovie
            cell.ivImage.image = movie.image
            cell.lblTitle.text = movie.title
            cell.lblDirector.text = movie.director
            return cell
        }
    }
}
