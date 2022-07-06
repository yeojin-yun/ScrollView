//
//  ScrollViewController.swift
//  scrollView
//
//  Created by 순진이 on 2022/07/05.
//

import UIKit
import SnapKit
class ScrollViewController: UIViewController {

    let scrollView = UIScrollView()
    let contentView = UIView()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
    }
}

// MARK: - SetUI
extension ScrollViewController {
    final private func setUI() {
        setDetails()
        setLayout()
    }

    final private func setDetails() {
        label.text = "주문 내역이 없습니다."
    }
    
    final private func setLayout() {
        [scrollView].forEach {
            view.addSubview($0)
        }


        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(4)
        }
        
        scrollView.addSubview(contentView)

        [label].forEach {
            contentView.addSubview($0)
        }

        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.equalTo(view)
        }
        
        label.snp.makeConstraints {
            $0.centerX.centerY.equalTo(contentView)
        }
    }
}
