//
//  ScrollCollectionViewController.swift
//  scrollView
//
//  Created by 순진이 on 2022/08/01.
//

import UIKit

private let reuseIdentifier = "Cell"

class ScrollCollectionViewController: UICollectionViewController {
    
    let images = [UIImage(named: "뭉치1"), UIImage(named: "뭉치2"), UIImage(named: "뭉치3")]


    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.isPagingEnabled = true
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? MyCollectionViewCell else { return UICollectionViewCell() }
        cell.imageView.image = images[indexPath.item]
        return cell
    }

}
