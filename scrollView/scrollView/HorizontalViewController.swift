//
//  HorizontalViewController.swift
//  scrollView
//
//  Created by 순진이 on 2022/07/05.
//

import UIKit
import SnapKit

class HorizontalViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let firstLabel = UILabel()
    let secondLabel = UILabel()
    let thirdLabel = UILabel()
    let firstImageView = UIImageView()
    let secondImageView = UIImageView()
    let thirdImageView = UIImageView()
    let pageControl = UIPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        // Do any additional setup after loading the view.
    }
}

extension HorizontalViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("offSet: \(scrollView.contentOffset.x)")
        print("width: \(scrollView.frame.size.width)")
        print(scrollView.contentOffset.x/scrollView.frame.size.width)
        print(fmod(scrollView.contentOffset.x, scrollView.frame.size.width))
        
        if fmod(scrollView.contentOffset.x, scrollView.frame.size.width) == 0 {
            
            let currentPage = Int(scrollView.contentOffset.x/scrollView.frame.size.width)
            pageControl.currentPage = currentPage
        }
    }
}

//MARK: -UI
extension HorizontalViewController {
    final private func configureUI() {
        setAttributes()
        setScrollView()
        setConstraints()
        setPageControl()
    }
    
    final private func setAttributes() {
        firstLabel.text = "측면 뭉치"
        secondLabel.text = "정면 뭉치"
        thirdLabel.text = "서 있는 뭉치"
        
        [firstImageView, secondImageView, thirdImageView].forEach {
            $0.contentMode = .scaleAspectFit
            firstImageView.image = UIImage(named: "뭉치1")
            secondImageView.image = UIImage(named: "뭉치2")
            thirdImageView.image = UIImage(named: "뭉치3")
        }
    }
    
    final private func setScrollView() {
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
    }
    
    final func setPageControl() {
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .darkGray
        pageControl.pageIndicatorTintColor = .lightGray
    }
    
    
    final private func setConstraints() {
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        scrollView.addSubview(contentView)
        [firstLabel, secondLabel, thirdLabel, firstImageView, secondImageView, thirdImageView].forEach {
            contentView.addSubview($0)
        }
        
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().inset(100)
            make.bottom.equalToSuperview().inset(300)
        }
        
        pageControl.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        let width = UIScreen.main.bounds.width
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.height.equalTo(scrollView.frameLayoutGuide)
            make.width.equalTo(width * 3)
        }
        
        firstImageView.snp.makeConstraints { make in
            make.leading.equalTo(contentView)
            make.bottom.equalTo(contentView)
            make.height.equalTo(300)
            make.width.equalTo(width)
        }
        
        firstLabel.snp.makeConstraints { make in
            make.centerX.equalTo(firstImageView)
            make.top.equalTo(contentView).offset(50)
        }
        
        secondImageView.snp.makeConstraints { make in
            make.leading.equalTo(firstImageView.snp.trailing)
            make.bottom.equalTo(contentView)
            make.height.width.equalTo(firstImageView)
        }
        
        secondLabel.snp.makeConstraints { make in
            make.centerX.equalTo(secondImageView)
            make.top.equalTo(contentView).offset(50)
        }
        
        thirdImageView.snp.makeConstraints { make in
            make.leading.equalTo(secondImageView.snp.trailing)
            make.bottom.equalTo(contentView)
            make.trailing.equalTo(contentView)
            make.height.width.equalTo(firstImageView)
        }
        
        thirdLabel.snp.makeConstraints { make in
            make.centerX.equalTo(thirdImageView)
            make.top.equalTo(contentView).offset(50)
        }
    }
}
