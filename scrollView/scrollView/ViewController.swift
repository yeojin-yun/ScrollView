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
}

extension ViewController {
    func setUI() {
        [verticalButton, horizontalButton, secondHorizontalButton].forEach {
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
    }
    
    func setDetail() {
        
        [verticalButton, horizontalButton, secondHorizontalButton].forEach {
            $0.setTitleColor(.white, for: .normal)
            verticalButton.backgroundColor = .black
            verticalButton.addTarget(self, action: #selector(verticalBtnTapped(_:)), for: .touchUpInside)
            verticalButton.setTitle("Vertical", for: .normal)
            horizontalButton.backgroundColor = .blue
            horizontalButton.addTarget(self, action: #selector(horizontalBtnTapped(_:)), for: .touchUpInside)
            horizontalButton.setTitle("horizontal", for: .normal)
            secondHorizontalButton.backgroundColor = .blue.withAlphaComponent(0.5)
            secondHorizontalButton.addTarget(self, action: #selector(horizontal2BtnTapped(_:)), for: .touchUpInside)
            secondHorizontalButton.setTitle("horizontal2", for: .normal)
        }
    }
}
