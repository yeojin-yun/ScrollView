//
//  SecondHorizontalViewController.swift
//  scrollView
//
//  Created by 순진이 on 2022/07/11.
//

import UIKit
import SnapKit

class SecondHorizontalViewController: UIViewController {

    let scrollView = UIScrollView()
    let contentView = UIView()
    //let imageView = UIImageView()
    let images = ["뭉치1", "뭉치2", "뭉치3"]
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        scrollView.frame = CGRect(
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        scrollWithImageView()
    }
}

extension SecondHorizontalViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
        print("width: \(scrollView.frame.size.width)")
    }
    
    func scrollWithImageView() {
        for index in 0..<images.count {
            let imageView = UIImageView()
            let positionX = self.view.frame.width * CGFloat(index)
            print("⭐️\(positionX)")
            imageView.frame = CGRect(x: positionX, y: -150, width: self.scrollView.bounds.width, height: self.scrollView.bounds.height)
            imageView.image = UIImage(named: images[index])
            imageView.contentMode = .scaleAspectFit
            scrollView.contentSize.width = imageView.frame.width * CGFloat(index + 1)
            self.scrollView.addSubview(imageView)
        }
    }
}

extension SecondHorizontalViewController {
    func configureUI() {
        setDetail()
        setLayout()
        setScrollView()
    }

    final private func setScrollView() {
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
    }
    
    func setDetail() {
        scrollView.backgroundColor = .red
        //imageView.image = UIImage(named: "뭉치1")
    }
    
    func setLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        //contentView.addSubview(imageView)
        
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().inset(100)
            make.bottom.equalToSuperview().inset(300)
        }
        
        let width = UIScreen.main.bounds.width
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.height.equalTo(scrollView.frameLayoutGuide)
            make.width.equalTo(width * 3)
        }
        
//        imageView.snp.makeConstraints { make in
//            make.leading.equalTo(contentView)
//            make.bottom.equalTo(contentView)
//            make.height.equalTo(scrollView.frameLayoutGuide)
//            make.width.equalTo(width)
//        }
    }
}
