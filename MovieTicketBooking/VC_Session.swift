//
//  VC_Session.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 4.09.2023.
//

import UIKit

final class VC_Session: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblContentRating: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    @IBOutlet weak var cvDays: UICollectionView!
    
    // MARK: - Variables
    public var movie: Movie?
    private var days: [Day] = []
    private var hours: [String] = []
    private var selectedDay: Day?
    private var selectedHour: String?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cvDays.register(UINib(nibName: "CVCell_Day", bundle: nil), forCellWithReuseIdentifier: "CVCell_Day")
        cvDays.collectionViewLayout = CVFlowLayout_Days()
        initMovie()
        initDays()
        initHours()
    }
    
    // MARK: - Functions
    func initMovie() {
        guard movie != nil else { return }
        ivImage.image = movie!.image
        lblTitle.text = movie!.title
        lblDuration.text = movie!.durationString()
        lblContentRating.text = movie!.contentRating.rawValue
        lblGenre.text = movie!.genresString()
    }
    
    func initDays() {
        let today = Date()
        for i in 0..<10 {
            let date = today.futureDate(daysToAdd: i)
            let day: Day = Day(date: date)
            days.append(day)
        }
        selectedDay = days.first
    }
    
    func initHours() {
        for i in 0..<10 {
            let remains = i % 2
            let hour = 9 + Int(floor(Double(i/2)))
            let minute = remains % 2 == 0 ? "00" : "30"
            let time = "\(formatSingleDigitNumber(hour)):\(minute)"
            hours.append(time)
        }
    }
    
    func formatSingleDigitNumber(_ number: Int) -> String {
        if number < 10 {
            return "0\(number)"
        } else {
            return "\(number)"
        }
    }
    
    func goToChooseSeatsView() {
        if selectedHour == nil {
            self.showToast(message: "Please choose a session")
        } else {
            let vcSeats = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "VC_Seats") as! VC_Seats
            vcSeats.movie = movie
            vcSeats.day = selectedDay!
            vcSeats.hour = selectedHour!
            navigationController?.pushViewController(vcSeats, animated: true)
        }
    }
    
    // MARK: - Actions
    @IBAction func btnChooseSeats_TUI(_ sender: Any) {
        goToChooseSeatsView()
    }

}

extension VC_Session: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return days.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let day: Day = days[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell_Day", for: indexPath) as! CVCell_Day
        cell.lblMonth.text = day.getMonth()
        cell.lblDay.text = day.getDay()
        if day.isIdentical(selectedDay!) {
            cell.selectDay()
        } else {
            cell.unSelectDay()
        }
        return cell
    }
}

extension VC_Session: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hour: String = hours[indexPath.row]
        let cell = Bundle.main.loadNibNamed("TVCell_Hour", owner: self)?.first as! TVCell_Hour
        cell.lblHour.text = hour
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hour = hours[indexPath.row]
        selectedHour = hour
    }
}
