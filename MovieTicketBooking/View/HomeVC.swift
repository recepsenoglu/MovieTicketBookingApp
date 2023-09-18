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
    @IBOutlet weak private var upcomingMoviesHeader: MovieSlideHeader!
    @IBOutlet weak private var upcomingMoviesCV: UICollectionView!
    
    // MARK: - Variables
    
    private var movies: [Movie] = []
    private var upcomingMovies: [Movie] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovies()
        loadUpcomingMovies()
        setupCollectionViews()
        configureReusableViewHeaders()
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
    
    private func loadMovies() {
        movies = [
            Movie(
                image: "Oppenheimer",
                title: "Oppenheimer",
                filmReview: "The story of American scientist, J. Robert Oppenheimer, and his role in the development of the atomic bomb.",
                releaseDate: "21/07/2023".toDate(),
                duration: 180,
                genres: [Genre.Biography, Genre.Drama, Genre.History],
                contentRating: ContentRating.R,
                director: "Christopher Nolan",
                cast: ["Cillian Murphy", "Emily Blunt", "Matt Damon"],
                star: 4
            ), Movie(
                image: "Barbie",
                title: "Barbie",
                filmReview: "Barbie suffers a crisis that leads her to question her world and her existence.",
                releaseDate: "21/07/2023".toDate(),
                duration: 114,
                genres: [Genre.Adventure, Genre.Comedy, Genre.Fantasy],
                contentRating: ContentRating.PG13,
                director: "Greta Gerwig",
                cast: ["Margot Robbie", "Ryan Gosling", "Issa Rae"],
                star: 3
            ), Movie(
                image: "Interstellar",
                title: "Interstellar",
                filmReview: "When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans.",
                releaseDate: "07/11/2014".toDate(),
                duration: 169,
                genres: [Genre.SciFi, Genre.Drama, Genre.Adventure],
                contentRating: ContentRating.PG13,
                director: "Christopher Nolan",
                cast: ["Matthew McConaughey", "Anne Hathaway", "Jessica Chastain"],
                star: 5
            ), Movie(
                image: "TheDarkKnight",
                title: "The Dark Knight",
                filmReview: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
                releaseDate: "25/07/2008".toDate(),
                duration: 152,
                genres: [Genre.Action, Genre.Crime, Genre.Drama],
                contentRating: ContentRating.PG13,
                director: "Christopher Nolan",
                cast: ["Christian Bale", "Heath Ledger", "Aaron Eckhart"],
                star: 5
            ), Movie(
                image: "InglouriousBasterds",
                title: "Inglourious Basterds",
                filmReview: "In Nazi-occupied France during World War II, a plan to assassinate Nazi leaders by a group of Jewish U.S. soldiers coincides with a theatre owner's vengeful plans for the same.",
                releaseDate: "21/08/2009".toDate(),
                duration: 153,
                genres: [Genre.Adventure, Genre.Drama],
                contentRating: ContentRating.R,
                director: "Quentin Tarantino",
                cast: ["Brad Pitt", "Diane Kruger", "Eli Roth"],
                star: 5
            ), Movie(
                image: "SpiderManATS",
                title: "Spider-Man: Across the Spider-Verse",
                filmReview: "Miles Morales catapults across the Multiverse, where he encounters a team of Spider-People charged with protecting its very existence. When the heroes clash on how to handle a new threat, Miles must redefine what it means to be a hero.",
                releaseDate: "02/06/2023".toDate(),
                duration: 140,
                genres: [Genre.Animation, Genre.Adventure, Genre.Action],
                contentRating: ContentRating.PG,
                director: "Joaquim Dos Santos",
                cast: ["Shameik Moore", "Hailee Steinfeld", "Brian Tyree Henry"],
                star: 4
            ), Movie(
                image: "GORA",
                title: "G.O.R.A.",
                filmReview: "A slick young Turk kidnapped by extraterrestrials shows his great « humanitarian spirit » by outwitting the evil commander-in-chief of the planet of G.O.R.A.",
                releaseDate: "12/11/2004".toDate(),
                duration: 127,
                genres: [Genre.SciFi, Genre.Comedy, Genre.Adventure],
                contentRating: ContentRating.NC17,
                director: "Ömer Faruk Sorak",
                cast: ["Cem Yilmaz", "Özge Özberk", "Ozan Güven"],
                star: 3
            ),
            ]
    }
    
    private func loadUpcomingMovies() {
        upcomingMovies = [
             Movie(
                image: "SawX",
                title: "Saw X",
                filmReview: "John Kramer (Tobin Bell) is back. The most chilling installment of the SAW franchise yet explores the untold chapter of Jigsaw's most personal game. Set between the events of SAW I and II, a sick and desperate John travels to Mexico for a risky and experimental medical procedure in hopes of a miracle cure for his cancer - only to discover the entire operation is a scam to defraud the most vulnerable. Armed with a newfound purpose, John returns to his work, turning the tables on the con artists in his signature visceral way through a series of ingenious and terrifying traps. A Lionsgate release. Twisted Pictures presents, a Burg/Koules production.",
                releaseDate: "29/09/2023".toDate(),
                duration: 118,
                genres: [Genre.Horror, Genre.Thriller, Genre.Mystery],
                contentRating: ContentRating.R,
                director: "Kevin Greutert",
                cast: ["Tobin Bell", "Shawnee Smith", "Synnøve Macody Lund"],
                star: 3
            ), Movie(
                image: "DangerousWaters",
                title: "Dangerous Waters",
                filmReview: "A sailing holiday spirals out of control when a teenage daughter uncovers the dark past of her mother's new boyfriend.",
                releaseDate: "13/10/2023".toDate(),
                duration: 101,
                genres: [Genre.Thriller, ],
                contentRating: ContentRating.PG13,
                director: "John Barr",
                cast: ["Ray Liotta", "Saffron Burrows", "Eric Dane"],
                star: 2
            ), Movie(
                image: "TheHungerGamesTBOSAS",
                title: "The Hunger Games: The Ballad of Songbirds and Snakes",
                filmReview: "Coriolanus Snow mentors and develops feelings for the female District 12 tribute during the 10th Hunger Games.",
                releaseDate: "17/11/2023".toDate(),
                duration: 165,
                genres: [Genre.Action, Genre.Adventure, Genre.Drama],
                contentRating: ContentRating.PG13,
                director: "Francis Lawrence",
                cast: ["Rachel Zegler", "Hunter Schafer", "Jason Schwartzman"],
                star: 3
            ), Movie(
                image: "Consecration",
                title: "Consecration",
                filmReview: "After the alleged suicide of her priest brother, Grace travels to the remote Scottish convent where he fell to his death. Distrusting the Church's account, she uncovers murder, sacrilege and a disturbing truth about herself.",
                releaseDate: "10/02/2024".toDate(),
                duration: 91,
                genres: [Genre.Horror, Genre.Thriller],
                contentRating: ContentRating.R,
                director: "Christopher Smith",
                cast: ["Jena Malone", "Danny Huston", "Will Keen"],
                star: 2
            ), Movie(
                image: "TheNunII",
                title: "The Nun II",
                filmReview: "1956 - France. A priest is murdered. An evil is spreading. The sequel to the worldwide smash hit follows Sister Irene as she once again comes face-to-face with Valak, the demon nun.",
                releaseDate: "08/09/2023".toDate(),
                duration: 110,
                genres: [Genre.Horror, Genre.Thriller, Genre.Mystery],
                contentRating: ContentRating.R,
                director: "Michael Chaves",
                cast: ["Taissa Farmiga", "Jonas Bloquet", "Storm Reid"],
                star: 3
            ),
        ]
    }
    
    private func setupCollectionViews() {
        moviesCV.setup("MoviePosterCVC", MoviePostersLayout())
        upcomingMoviesCV.setup("UpcomingMoviePosterCVC", MoviePostersLayout(bottomHeight: 35, imageAspectRatio: 1))
    }
    
    private func configureReusableViewHeaders() {
        moviesHeader.configureView(title: "Now Showing", onPressed: {self.goToMovies()})
        upcomingMoviesHeader.configureView(title: "Upcoming", onPressed: {self.goToMovies(ShowType.Upcoming)})
    }
    
    private func goToMovies(_ showType: ShowType = ShowType.NowShowing) {
        let moviesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MoviesVC") as! MoviesVC
        moviesVC.showType = showType
        moviesVC.movies = movies
        moviesVC.upcomingMovies = upcomingMovies
        navigationController?.pushViewController(moviesVC, animated: true)
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { collectionView == moviesCV ? movies.count : upcomingMovies.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let upcomingMovie: Bool = collectionView == upcomingMoviesCV
        let movie: Movie = upcomingMovie ? upcomingMovies[indexPath.row] : movies[indexPath.row]
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
        let movieDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailVC") as! MovieDetailVC
        movieDetailVC.movie = movie
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}
