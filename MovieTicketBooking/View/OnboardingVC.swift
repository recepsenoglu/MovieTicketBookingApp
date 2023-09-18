//
//  ViewController.swift
//  MovieTicketBooking
//
//  Created by Recep Oğuzhan Şenoğlu on 1.09.2023.
//

import UIKit

final class OnboardingVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var slidesCV: UICollectionView!
    @IBOutlet weak private var pageControl: UIPageControl!
    @IBOutlet weak private var btnNext: UIButton!
    @IBOutlet weak private var btnSkip: UIButton!
    
    // MARK: - Variables
    
    private var slides: [OnboardingSlide] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSlides()
        slidesCV.setup("OnboardingCVC", OnboardingFlowLayout())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Functions
    
    private func loadSlides() {
        let slide0 = OnboardingSlide(image: "Onboarding0", title: "Easy Ticket Booking", text: "Discover the effortless way to secure your movie tickets with just a few taps. Our user-friendly interface makes booking tickets a breeze, ensuring you spend less time in queues and more time enjoying your favorite films.")
        let slide1 = OnboardingSlide(image: "Onboarding1", title: "Online Payment", text: "Say goodbye to cash and hassle. With our secure online payment system, you can easily purchase tickets from the comfort of your device. Enjoy the convenience of digital transactions and worry less about carrying physical money.")
        let slide2 = OnboardingSlide(image: "Onboarding2", title: "Enjoy Watching!", text: "Get ready to immerse yourself in the world of cinema like never before. Once you've booked your tickets and made your payment, all that's left to do is sit back, relax, and savor the magic of the big screen. It's time to enjoy the show!")
        slides.append(contentsOf: [slide0, slide1, slide2])
    }
    
    private func setButtonAttributes(isLastPage: Bool) {
        let buttonTitle = isLastPage ? "  Start  " : "Next"
        btnNext.setAttributedTitle(NSAttributedString(string: buttonTitle, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .bold)]), for: .normal)
        btnSkip.isHidden = isLastPage
    }
    
    private func moveSlide(_ index: Int) {
        let pageIndexPath = IndexPath(item: index, section: 0)
        slidesCV.isPagingEnabled = false
        slidesCV.scrollToItem(at: pageIndexPath, at: .centeredHorizontally, animated: true)
        slidesCV.isPagingEnabled = true
    }
    
    private func goToHomeView() {
        performSegue(withIdentifier: "homeSegue", sender: self)
    }
    
    // MARK: - Actions
    
    @IBAction private func pageControl_ValueChanged(_ sender: Any) {
        let pageIndex = pageControl.currentPage
        moveSlide(pageIndex)
    }
    
    @IBAction private func btnNext_TUI(_ sender: Any) {
        let pageIndex = pageControl.currentPage
        guard pageIndex < 2 else {
            goToHomeView()
            return
        }
        moveSlide(pageIndex + 1)
    }
    
    @IBAction private func btnSkip_TUI(_ sender: Any) {
        goToHomeView()
    }
}

extension OnboardingVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCVC", for: indexPath) as! OnboardingCVC
        let slide = slides[indexPath.row]
        cell.setupCell(slide)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = slidesCV.bounds.width
        let currentPage = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
        if pageControl.currentPage != currentPage {
            setButtonAttributes(isLastPage: currentPage == slides.count - 1)
        }
        pageControl.currentPage = currentPage
    }
}

