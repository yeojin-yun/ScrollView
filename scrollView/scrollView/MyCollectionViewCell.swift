//
//  MyCollectionViewCell.swift
//  scrollView
//
//  Created by 순진이 on 2022/08/02.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    let scrollView = UIScrollView()
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setScrollView()
        setConstraints()
        setDoubleTap()
        scrollView.backgroundColor = .red
        imageView.backgroundColor = .yellow
    }
    
    func setDoubleTap() {
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(doubleTapped(_:)))
        doubleTapGesture.numberOfTapsRequired = 2
        addGestureRecognizer(doubleTapGesture)
    }
    
    @objc func doubleTapped(_ gestureRecognizer: UITapGestureRecognizer) {
        
    }
    
    func setScrollView() {
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 4.0
    }

    func setConstraints() {
        [scrollView, imageView].forEach {
            contentView.addSubview(scrollView)
            scrollView.addSubview(imageView)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            imageView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            imageView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyCollectionViewCell: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
