//
//  MyFarmDetailsPostsTableViewCell.swift
//  LadyBug
//
//  Created by SAMEH on 05/03/2021.
//

import UIKit

class MyFarmDetailsPostsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var addTitleLabel: UILabel!
    @IBOutlet weak var addTitleButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var posts = [Post]() {
        didSet {
            collectionView.reloadData()
        }
    }

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

extension MyFarmDetailsPostsTableViewCell {
    private func registerCell() {
        let nib = UINib(nibName: "\(MyFarmDetailsPostsChildCell.self)", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "\(MyFarmDetailsPostsChildCell.self)")
    }
    
    private func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 154, height: 154)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 21
        layout.minimumLineSpacing = 21
        layout.sectionInset = UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 17)
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
}

extension MyFarmDetailsPostsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MyFarmDetailsPostsChildCell.self)", for: indexPath) as? MyFarmDetailsPostsChildCell ?? MyFarmDetailsPostsChildCell()
        let post = posts[indexPath.row]
        cell.setupUI(title: post.farm, desc: post.content, logo: post.farmedTypePhoto)
        return cell
    }
}

