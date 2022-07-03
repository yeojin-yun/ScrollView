//
//  TemporaryViewController.swift
//  PhotyApp
//
//  Created by 순진이 on 2022/05/16.
//

import UIKit
import SnapKit


//이니셜 가이드 완성되면 레이아웃 다시 잡아야 함
class ViewController : UIViewController {
    let verticalButton = UIButton()
    let horizontalButton = UIButton()
    
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
}

extension ViewController {
    func setUI() {
        [verticalButton, horizontalButton].forEach {
            view.addSubview($0)
        }
        
        verticalButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(400)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        horizontalButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(verticalButton.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    func setDetail() {
        
        [verticalButton, horizontalButton].forEach {
            $0.setTitleColor(.white, for: .normal)
            verticalButton.backgroundColor = .black
            verticalButton.addTarget(self, action: #selector(verticalBtnTapped(_:)), for: .touchUpInside)
            verticalButton.setTitle("Vertical", for: .normal)
            horizontalButton.backgroundColor = .blue
            horizontalButton.addTarget(self, action: #selector(horizontalBtnTapped(_:)), for: .touchUpInside)
            horizontalButton.setTitle("horizontal", for: .normal)
        }
    }
}
