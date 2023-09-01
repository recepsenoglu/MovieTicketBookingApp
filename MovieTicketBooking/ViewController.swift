//
//  ViewController.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 1.09.2023.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var cvSlides: UICollectionView!
    @IBOutlet weak var pcPage: UIPageControl!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnSkip: UIButton!
    
    // MARK: - Variables
    var slides: [Slide] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cvSlides.register(UINib(nibName: "CVCell_Onboarding", bundle: nil), forCellWithReuseIdentifier: "CVCell_Onboarding")
        cvSlides.collectionViewLayout = CVFlowLayout_Onboarding()
        loadSlides()
        editNextButton()
    }
    
    // MARK: - Functions
    func loadSlides() {
        let slide0 = Slide(image: "Onboarding0", title: "Easy Ticket Booking", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vitae sodales ante. Morbi venenatis elit sit amet facilisis molestie. Nam accumsan urna lorem, vitae ornare lectus eleifend ac.")
        let slide1 = Slide(image: "Onboarding1", title: "Online Payment", text: slide0.text)
        let slide2 = Slide(image: "Onboarding2", title: "Enjoy Watching!", text: slide0.text)
        
        slides.append(contentsOf: [slide0, slide1, slide2])
    }
    
    func editNextButton() {
        btnNext.layer.cornerRadius = CGFloat(20)
    }
    
    func buttonsApperanceFix(isLastPage: Bool) {
        let buttonTitle = isLastPage ? "  Start  " : "Next"
        btnNext.setAttributedTitle(NSAttributedString(string: buttonTitle, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .bold)]), for: .normal)
        btnSkip.isHidden = isLastPage
    }
    
    func goToHomeView() {
        let vcHome = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC_Home") as! VC_Home
        present(vcHome, animated: true)
    }
    
    @IBAction func btnNext_TUI(_ sender: Any) {
        var currentPage = pcPage.currentPage
        
        if currentPage < 2 {
            currentPage += 1
            let nextPageIndexPath = IndexPath(item: currentPage, section: 0)
            cvSlides.scrollToItem(at: nextPageIndexPath, at: .centeredHorizontally, animated: true)
        } else {
            goToHomeView()
        }
    }
    @IBAction func btnSkip_TUI(_ sender: Any) {
        goToHomeView()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let slide = slides[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell_Onboarding", for: indexPath) as! CVCell_Onboarding
        cell.ivImage.image = slide.image
        cell.lblTitle.text = slide.title
        cell.lblText.text = slide.text
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = cvSlides.bounds.width
        let currentPage = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
        
        if pcPage.currentPage != currentPage {
            buttonsApperanceFix(isLastPage: currentPage == slides.count - 1)
        }
        
        pcPage.currentPage = currentPage
    }
}

