//
//  VerticalViewController.swift
//  ScrollerTEst
//
//  Created by 순진이 on 2022/06/28.
//

import UIKit
import SnapKit

//이니셜 가이드 완성되면 레이아웃 다시 잡아야 함
class VerticalViewController : UIViewController {
 
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let firstLabel = UILabel()
    let secondLabel = UILabel()
    let thirdLabel = UILabel()
    let firstImageView = UIImageView()
    let secondImageView = UIImageView()
    let thirdImageView = UIImageView()
    let lastButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
    }
    @objc func buttonTapped(_ sender: UIButton) {
        let scrollVC = ScrollViewController()
        self.navigationController?.pushViewController(scrollVC, animated: true)
    }
}

// MARK: - SetUI
extension VerticalViewController {
    final private func setUI() {
        setDetails()
        setLayout()
        addTarget()
    }

    final private func setDetails() {
        firstLabel.text = "측면 뭉치"
        secondLabel.text = "정면 뭉치"
        thirdLabel.text = "서 있는 뭉치"
        
        [firstImageView, secondImageView, thirdImageView].forEach {
            $0.contentMode = .scaleAspectFit
            firstImageView.image = UIImage(named: "뭉치1")
            secondImageView.image = UIImage(named: "뭉치2")
            thirdImageView.image = UIImage(named: "뭉치3")
        }
        
        lastButton.setTitle("버튼입니다.", for: .normal)
        lastButton.setTitleColor(.white, for: .normal)
        lastButton.backgroundColor = .black
    }
    
    final private func addTarget() {
        lastButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    final private func setLayout() {
        [scrollView].forEach {
            view.addSubview($0)
        }


        scrollView.snp.makeConstraints {
            $0.leading.top.trailing.bottom.equalToSuperview()
//            $0.top.equalToSuperview().offset(92)
//            $0.trailing.equalToSuperview().inset(50)
//            $0.bottom.equalToSuperview().inset(240)
            //$0.height.equalTo(1500)
        }
        
        scrollView.addSubview(contentView)

        [firstLabel, secondLabel, thirdLabel, firstImageView, secondImageView, thirdImageView, lastButton].forEach {
            contentView.addSubview($0)
        }

        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.equalTo(1200)
        }
        
        firstLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(contentView).offset(50)
        }
        firstImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(firstLabel.snp.bottom).offset(15)
            make.height.equalTo(300)
            make.leading.trailing.equalTo(contentView)
        }
        
        secondLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(firstImageView.snp.bottom).offset(50)
        }
        
        secondImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(secondLabel.snp.bottom).offset(15)
            make.height.equalTo(300)
            make.leading.trailing.equalToSuperview()
        }
        
        thirdLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(secondImageView.snp.bottom).offset(50)
        }
        
        thirdImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(thirdLabel.snp.bottom).offset(15)
            make.height.equalTo(300)
            make.leading.trailing.equalToSuperview()
        }
        lastButton.snp.makeConstraints { make in
//            make.top.equalTo(thirdImageView.snp.bottom).offset(15)
            make.bottom.equalTo(contentView)
            make.leading.trailing.equalToSuperview().inset(20)
            
        }
    }
}
