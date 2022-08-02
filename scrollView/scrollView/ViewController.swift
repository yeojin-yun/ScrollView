//
//  ViewController.swift
//  scrollView
//
//  Created by 순진이 on 2022/07/05.
//

import UIKit
import SnapKit

class ViewController : UIViewController {
    let verticalButton = UIButton()
    let horizontalButton = UIButton()
    let secondHorizontalButton = UIButton()
    let scrollButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setDetail()
    }
    
    @objc func verticalBtnTapped(_ sender: UIButton) {
        let nextVC = VerticalViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func horizontalBtnTapped(_ sender: UIButton) {
        let nextVC = HorizontalViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    @objc func horizontal2BtnTapped(_ sender: UIButton) {
        let nextVC = SecondHorizontalViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func collectionViewTapped(_ sender: UIButton) {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width

        layout.itemSize = CGSize(width: width, height: width)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal

        let nextVC = ScrollCollectionViewController(collectionViewLayout: layout)
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension ViewController {
    func setUI() {
        [verticalButton, horizontalButton, secondHorizontalButton, scrollButton].forEach {
            view.addSubview($0)
        }
        
        verticalButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        horizontalButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(verticalButton.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        secondHorizontalButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(horizontalButton.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        scrollButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(secondHorizontalButton.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    func setDetail() {
        
        [verticalButton, horizontalButton, secondHorizontalButton].forEach {
            $0.setTitleColor(.white, for: .normal)
            verticalButton.backgroundColor = .black
            verticalButton.addTarget(self, action: #selector(verticalBtnTapped(_:)), for: .touchUpInside)
            verticalButton.setTitle("Vertical Scroll", for: .normal)
            horizontalButton.backgroundColor = .blue
            horizontalButton.addTarget(self, action: #selector(horizontalBtnTapped(_:)), for: .touchUpInside)
            horizontalButton.setTitle("horizontal Scroll(paging)", for: .normal)
            secondHorizontalButton.backgroundColor = .blue.withAlphaComponent(0.8)
            secondHorizontalButton.addTarget(self, action: #selector(horizontal2BtnTapped(_:)), for: .touchUpInside)
            secondHorizontalButton.setTitle("horizontal Scroll(paging)", for: .normal)
            scrollButton.backgroundColor = .blue.withAlphaComponent(0.6)
            scrollButton.addTarget(self, action: #selector(collectionViewTapped(_:)), for: .touchUpInside)
            scrollButton.setTitle("collectionView paging", for: .normal)
        }
    }
}
