//
//  VC_Session.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 4.09.2023.
//

import UIKit

final class ReservationVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var imageIV: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var durationLabel: UILabel!
    @IBOutlet weak private var contentRatingLabel: UILabel!
    @IBOutlet weak private var genreLabel: UILabel!
    @IBOutlet weak private var sessionDaysCV: UICollectionView!
    
    // MARK: - Variables
    
    var movie: Movie?
    private var sessionDays: [Session] = []
    private var selectedSession: Session?
    private var sessionTimes: [String] = []
    private var selectedTime: String?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDays()
        initTimes()
        fillMovieInfo()
        sessionDaysCV.setup("SessionDayCVC", SessionDaysFlowLayout())
    }
    
    // MARK: - Functions
    
    private func initDays() {
        let today = Date()
        for i in 0..<10 {
            let date = today.futureDate(daysToAdd: i)
            let day: Session = Session(date: date)
            sessionDays.append(day)
        }
        selectedSession = sessionDays.first
    }
    
    private func initTimes() {
        for i in 0..<10 {
            let remains = i % 2
            let hour = 9 + Int(floor(Double(i/2)))
            let minute = remains % 2 == 0 ? "00" : "30"
            let time = "\(hour.formatSingleDigitNumber()):\(minute)"
            sessionTimes.append(time)
        }
    }
    
    private func fillMovieInfo() {
        guard let movie = movie else { return }
        imageIV.image = movie.image
        titleLabel.text = movie.title
        durationLabel.text = movie.durationString()
        contentRatingLabel.text = movie.contentRating.rawValue
        genreLabel.text = movie.genresString()
    }
        
    // MARK: - Actions
    
    @IBAction private func btnChooseSeats_TUI(_ sender: Any) {
        guard let selectedTime = selectedTime else {
            self.showToast("Please choose a session")
            return
        }
        let seatsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SeatsVC") as! SeatsVC
        seatsVC.movie = movie
        selectedSession?.time = selectedTime
        seatsVC.session = selectedSession
        navigationController?.pushViewController(seatsVC, animated: true)
    }
}

extension ReservationVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sessionDays.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SessionDayCVC", for: indexPath) as! SessionDayCVC
        let sessionDay = sessionDays[indexPath.row]
        cell.setupCell(session: sessionDay, selected: sessionDay.isIdentical(selectedSession))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedSession = sessionDays[indexPath.row]
        sessionDaysCV.reloadData()
    }
}

extension ReservationVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { sessionTimes.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("SessionTimeTVC", owner: self)?.first as! SessionTimeTVC
        cell.setupCell(time: sessionTimes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTime = sessionTimes[indexPath.row]
    }
}
