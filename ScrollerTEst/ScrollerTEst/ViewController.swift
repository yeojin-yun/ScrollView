//
//  TemporaryViewController.swift
//  PhotyApp
//
//  Created by 순진이 on 2022/05/16.
//

import UIKit
import SnapKit
import Photos
import PhotosUI

//이니셜 가이드 완성되면 레이아웃 다시 잡아야 함
class ViewController : UIViewController {
 
    let initialGuideImage = [
        UIImage(named: "initialguide_01"),
        UIImage(named: "initialguide_02"),
        UIImage(named: "initialguide_03"),
        UIImage(named: "initialguide_04")]
    
    let colors: [UIColor] = [.red, .orange, .yellow, .green]
    
    //⭐️
    let memoryScrollView = UIScrollView()
    
    private let contentView = UIView()
    
    private let initialImageView = UIImageView()
    private let initialImageView1 = UIImageView()
    private let initialImageView2 = UIImageView()
    private let initialImageView3 = UIImageView()
    private let initialImageView4 = UIImageView()
    
    private let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let memoryPageControl = UIPageControl()
    let startButton = UIButton(type: .system)

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //memoryScrollView.frame = UIScreen.main.bounds
        setScrollView()
        //setImageViewInScrollView()
        //testSetImageViewInScrollView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()

        setPageControl()
        setScrollView()
        setImageViewInScrollView()
    }
    deinit {
        print("temp deinit")
    }

    final private func setImageViewInScrollView() {
        for index in 0..<initialGuideImage.count {
            //let imageView = UIImageView()
            print("index: \(index)")

            let positionX = self.view.frame.width * CGFloat(index)
            contentView.frame = CGRect(x: positionX, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            print("contentView: \(contentView.frame.origin)")
            initialImageView.image = initialGuideImage[index]
            initialImageView.contentMode = .scaleAspectFit
            memoryScrollView.contentSize.width = contentView.frame.width * CGFloat(index + 1)
            contentView.backgroundColor = colors[index]
            print("contentOffset \(memoryScrollView.contentOffset)")
//            print("frameLayoutGuide: \(memoryScrollView.frameLayoutGuide)")
//            print("contentLayoutGuide: \(memoryScrollView.contentLayoutGuide)")
//            print("contentSize.Width: \(memoryScrollView.contentSize.width)")
//            initialImageView.translatesAutoresizingMaskIntoConstraints = false
//            contentView.addSubview(initialImageView)
//            initialImageView.snp.makeConstraints {
//                $0.centerX.equalToSuperview()
//                $0.leading.equalTo(contentView).offset(50)
//                $0.top.equalTo(contentView).offset(92)
//                $0.trailing.equalTo(contentView).inset(50)
//                $0.bottom.equalTo(contentView).inset(150)
//            }
        }
    }
    

}

extension ViewController {
    final private func setPageControl() {
        memoryPageControl.numberOfPages = initialGuideImage.count
        memoryPageControl.currentPage = 0
        memoryPageControl.pageIndicatorTintColor = .darkGray
        memoryPageControl.currentPageIndicatorTintColor = .lightGray
        
    }
    final private func setScrollView() {
        memoryScrollView.delegate = self
        memoryScrollView.alwaysBounceVertical = false
        memoryScrollView.showsVerticalScrollIndicator = false
        memoryScrollView.showsHorizontalScrollIndicator = false
        memoryScrollView.isScrollEnabled = true
        memoryScrollView.isPagingEnabled = true
        memoryScrollView.bounces = true
    }
    

}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if fmod(memoryScrollView.contentOffset.x, memoryScrollView.frame.size.width) == 0 {
            let pageNumber = Int(memoryScrollView.contentOffset.x/memoryScrollView.frame.size.width)
            memoryPageControl.currentPage = pageNumber
        }
    }
}

// MARK: - SetUI
extension ViewController {
    final private func setUI() {
        setDetails()
        setLayout()
    }

    final private func setDetails() {
//        [initialImageView1, initialImageView2, initialImageView3, initialImageView4].forEach {
//            $0.contentMode = .scaleAspectFit
//            contentView.addSubview($0)
//            $0.translatesAutoresizingMaskIntoConstraints = false
//            initialImageView1.image = UIImage(named: "initialguide_01")
//            initialImageView1.image = UIImage(named: "initialguide_02")
//            initialImageView1.image = UIImage(named: "initialguide_03")
//            initialImageView1.image = UIImage(named: "initialguide_04")
//        }
        memoryScrollView.backgroundColor = .yellow
        //contentView.backgroundColor = .blue

    }
    
    final private func setLayout() {
        [memoryScrollView, memoryPageControl, startButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [contentView].forEach {
            memoryScrollView.addSubview(contentView)
            //contentView.addSubview(initialImageView)
            initialImageView.translatesAutoresizingMaskIntoConstraints = false
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        memoryScrollView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(50)
            $0.top.equalToSuperview().offset(92)
            $0.trailing.equalToSuperview().inset(50)
            $0.bottom.equalToSuperview().inset(240)
        }
        
        contentView.snp.makeConstraints {
            $0.leading.top.trailing.bottom.equalTo(memoryScrollView.contentLayoutGuide)
//            $0.centerX.equalToSuperview()
//            $0.leading.equalTo(memoryScrollView).offset(50)
//            $0.top.equalTo(memoryScrollView).offset(150)
//            $0.trailing.equalTo(memoryScrollView).inset(50)
//            $0.bottom.equalTo(memoryScrollView)
            $0.height.equalTo(memoryScrollView.frameLayoutGuide)
//            $0.edges.equalTo(memoryScrollView.contentLayoutGuide)
        }
//
//        initialImageView1.snp.makeConstraints {
//            $0.centerX.equalToSuperview()
//            $0.leading.equalTo(contentView).offset(50)
//            $0.top.equalTo(contentView).offset(92)
//            $0.trailing.equalTo(contentView).inset(50)
//            $0.bottom.equalTo(memoryPageControl.snp.top).offset(-50)
//        }

//        initialImageView.snp.makeConstraints {
//            $0.centerX.equalToSuperview()
//            $0.leading.equalTo(contentView).offset(50)
//            $0.top.equalTo(contentView).offset(92)
//            $0.trailing.equalTo(contentView).inset(50)
//            $0.bottom.equalTo(contentView).inset(150)
//        }

        
        memoryPageControl.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(startButton.snp.top).offset(-24)
            $0.height.equalTo(40)
            $0.width.equalTo(view.safeAreaLayoutGuide)
        }
        
        //이니셜 가이드 완성되면 레이아웃 다시 잡아야 함
        startButton.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            //            $0.top.equalTo(memoryPageControl.snp.bottom).offset(57)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(40)
            $0.height.equalTo(52)
        }
    }
}
