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
    case Mystery
    case Romance
    case Thriller
    case Crime
    case SciFi = "Sci-Fi"
    case Musical
    case Biography
    case History
    case Adventure
    case Animation
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
    var filmReview: String
    var releaseDate: Date
    var duration: Int
    var genres: [Genre]
    var contentRating: ContentRating
    var director: String
    var cast: [String]
    var star: Int
    
    init(
        image imageAssetName: String,
        title: String,
        filmReview: String,
        releaseDate: Date,
        duration: Int,
        genres: [Genre],
        contentRating: ContentRating,
        director: String,
        cast: [String],
        star: Int
    ) {
        self.image = UIImage(named: imageAssetName) ?? UIImage(systemName: "photo")!
        self.title = title
        self.filmReview = filmReview
        self.releaseDate = releaseDate
        self.duration = duration
        self.genres = genres
        self.contentRating = contentRating
        self.director = director
        self.cast = cast
        self.star = star
    }
    
    func isIdentical(_ other: Movie) -> Bool {
        return title == other.title && releaseDate.isSameDate(other.releaseDate) && director == other.director
    }
    
    func durationString() -> String {
        let hour: Int = Int(floor(Double(duration) / 60))
        let minute: Int = duration - hour * 60
        let hourStr = minute > 0 ? "Hr." : hour > 1 ? "Hours" : "Hour"
        return "\(hour) \(hourStr) \(minute > 0 ? "\(minute) Min." : "")"
    }
    
    func releaseDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: releaseDate)
    }
    
    func genresString() -> String {
        var first3Genres: [String] = []
        for i in 0..<(genres.count > 2 ? 3 : genres.count) {
            first3Genres.append(genres[i].rawValue)
        }
        return first3Genres.joined(separator: ", ")
    }
    
    func castList() -> NSAttributedString {
        let castString = NSAttributedString(string: "Cast: ", attributes: [.font: UIFont.systemFont(ofSize: 17, weight: .medium)])
        let list = NSAttributedString(string: cast.joined(separator: ", "), attributes: [.font: UIFont.systemFont(ofSize: 17)])
        let castList = NSMutableAttributedString()
        castList.append(castString)
        castList.append(list)
        return castList
    }
}
