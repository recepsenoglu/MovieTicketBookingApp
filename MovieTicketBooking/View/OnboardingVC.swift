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
        setupCollectionView()
        loadSlides()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Functions
    
    private func setupCollectionView() {
        slidesCV.register(UINib(nibName: "OnboardingCVC", bundle: nil), forCellWithReuseIdentifier: "OnboardingCVC")
        slidesCV.collectionViewLayout = OnboardingFlowLayout()
    }
    
    private func loadSlides() {
        let slide0 = OnboardingSlide(image: "Onboarding0", title: "Easy Ticket Booking", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vitae sodales ante. Morbi venenatis elit sit amet facilisis molestie. Nam accumsan urna lorem, vitae ornare lectus eleifend ac.")
        let slide1 = OnboardingSlide(image: "Onboarding1", title: "Online Payment", text: slide0.text)
        let slide2 = OnboardingSlide(image: "Onboarding2", title: "Enjoy Watching!", text: slide0.text)
        slides.append(contentsOf: [slide0, slide1, slide2])
    }
    
    private func setButtonAttributes(isLastPage: Bool) {
        let buttonTitle = isLastPage ? "  Start  " : "Next"
        btnNext.setAttributedTitle(NSAttributedString(string: buttonTitle, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .bold)]), for: .normal)
        btnSkip.isHidden = isLastPage
    }
    
    private func moveSlide(_ index: Int) {
        print("index: \(index)")
        let pageIndexPath = IndexPath(item: index, section: 0)
        slidesCV.isPagingEnabled = false
        slidesCV.scrollToItem(at: pageIndexPath, at: .centeredHorizontally, animated: true)
        slidesCV.isPagingEnabled = true
    }
    
    private func goToHomeView() {
        let vcHome = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        navigationController?.pushViewController(vcHome, animated: true)
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

