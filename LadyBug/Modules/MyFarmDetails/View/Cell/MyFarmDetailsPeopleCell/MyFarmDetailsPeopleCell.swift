//
//  MyFarmDetailsPeopleCell.swift
//  LadyBug
//
//  Created by SAMEH on 05/03/2021.
//

import UIKit

class MyFarmDetailsPeopleCell: UITableViewCell {
    @IBOutlet weak var addTitleLabel: UILabel!
    @IBOutlet weak var addTitleButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        registerCell()
        setupCollectionViewLayout()
    }
    
    func setupUI() {
        addTitleLabel.textColor = .purplishBrown
        addTitleLabel.font = UIFont.get(enFont: .bold(12), arFont: .bold(12))
        collectionView.reloadData()
    }
}

extension MyFarmDetailsPeopleCell {
    private func registerCell() {
        let nib = UINib(nibName: "\(MyFarmDetailsPeopleChildCell.self)", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "\(MyFarmDetailsPeopleChildCell.self)")
    }
    
    private func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.bounds.width / 2.8, height: 83)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 21
        layout.minimumLineSpacing = 21
        layout.sectionInset = UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 17)
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
}

extension MyFarmDetailsPeopleCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MyFarmDetailsPeopleChildCell.self)", for: indexPath) as? MyFarmDetailsPeopleChildCell ?? MyFarmDetailsPeopleChildCell()
        cell.setupUI()
        return cell
    }
    
    
}
