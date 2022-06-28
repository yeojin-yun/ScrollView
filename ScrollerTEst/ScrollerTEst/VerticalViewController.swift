//
//  VerticalViewController.swift
//  ScrollerTEst
//
//  Created by 순진이 on 2022/06/28.
//

import UIKit

//이니셜 가이드 완성되면 레이아웃 다시 잡아야 함
class VerticalViewController : UIViewController {
 
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let firstLabel = UILabel()
    let secondLabel = UILabel()
    let imageView = UIImageView()
    let imageView2 = UIImageView()

    
    override func viewDidLayoutSubviews() {
        scrollView.contentSize.height = contentView.frame.width * CGFloat(3)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        scrollView.isScrollEnabled = true
        scrollView.isPagingEnabled = true
    }


//    final private func setImageViewInScrollView() {
//        for index in 0..<initialGuideImage.count {
//            //let imageView = UIImageView()
//            print("index: \(index)")
//
//            let positionX = self.view.frame.width * CGFloat(index)
//            contentView.frame = CGRect(x: positionX, y: 0, width: self.view.frame.width, height: self.view.frame.height)
//            print("contentView: \(contentView.frame.origin)")
//            initialImageView.image = initialGuideImage[index]
//            initialImageView.contentMode = .scaleAspectFit
//            memoryScrollView.contentSize.width = contentView.frame.width * CGFloat(index + 1)
//            contentView.backgroundColor = colors[index]
//        }
//    }
}

//extension VerticalViewController {
//    final private func setPageControl() {
//        memoryPageControl.numberOfPages = initialGuideImage.count
//        memoryPageControl.currentPage = 0
//        memoryPageControl.pageIndicatorTintColor = .darkGray
//        memoryPageControl.currentPageIndicatorTintColor = .lightGray
//
//    }
//    final private func setScrollView() {
//        scrollView.delegate = self
//        scrollView.alwaysBounceVertical = false
//        scrollView.showsVerticalScrollIndicator = false
//        scrollView.showsHorizontalScrollIndicator = false
//        scrollView.isScrollEnabled = true
//        scrollView.isPagingEnabled = true
//        scrollView.bounces = true
//    }
//
//
//}

//extension VerticalViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if fmod(memoryScrollView.contentOffset.x, memoryScrollView.frame.size.width) == 0 {
//            let pageNumber = Int(memoryScrollView.contentOffset.x/memoryScrollView.frame.size.width)
//            memoryPageControl.currentPage = pageNumber
//        }
//    }
//}

// MARK: - SetUI
extension VerticalViewController {
    final private func setUI() {
        setDetails()
        setLayout()
    }

    final private func setDetails() {
        scrollView.backgroundColor = .yellow
        contentView.backgroundColor = .red
        firstLabel.text = "첫 번째 레이블"
        secondLabel.text = "두 번째 레이블"
        imageView.image = UIImage(systemName: "house")
        imageView2.image = UIImage(systemName: "house")
        imageView.contentMode = .scaleAspectFit
    }
    
    final private func setLayout() {
        [scrollView].forEach {
            view.addSubview($0)
        }


        scrollView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(50)
            $0.top.equalToSuperview().offset(92)
            $0.trailing.equalToSuperview().inset(50)
            $0.bottom.equalToSuperview().inset(240)
            //$0.height.equalTo(1500)
        }
        
        scrollView.addSubview(contentView)
        contentView.addSubview(firstLabel)
        contentView.addSubview(secondLabel)
        contentView.addSubview(imageView)
        contentView.addSubview(imageView2)
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        firstLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(scrollView).offset(100)
        }
        
        secondLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(firstLabel).offset(100)
        }
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(secondLabel).offset(100)
            make.height.equalTo(100)
            make.leading.trailing.equalToSuperview().inset(100)
        }
        
        imageView2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(100)
            make.height.equalTo(100)
            make.leading.trailing.equalToSuperview().inset(100)
        }
        
        
    }
}
