//
//  Movie.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 2.09.2023.
//

import Foundation
import UIKit

enum Genre: String {
    case Action
    case Comedy
    case Drama
    case Fantasy
    case Horror
    case Mistery
    case Romance
    case Thriller
    case Crime
    case SciFi = "Sci-Fi"
    case Musical
    case Biography
}

enum ContentRating: String {
    case G
    case PG
    case PG13 = "PG-13"
    case R
    case NC17 = "NC-17"
}

struct Movie {
    var image: UIImage
    var title: String
    var description: String
    var showingDate: Date
    var time: Int
    var genres: [Genre]
    var contentRating: ContentRating
    var director: String
    var cast: [String]
    var star: Int
    
    init(imageAssetName image: String, title: String, description: String, showingDate: Date, time: Int, genres: [Genre], contentRating: ContentRating, director: String, cast: [String], star: Int) {
        self.image = UIImage(named: image)!
        self.title = title
        self.description = description
        self.showingDate = showingDate
        self.time = time
        self.genres = genres
        self.contentRating = contentRating
        self.director = director
        self.cast = cast
        self.star = star
    }
}
