//
//  HomeHeaderView.swift
//  LadyBug
//
//  Created by Sameh on 2/15/21.
//

import UIKit

class HomeHeaderView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate: HomeHeaderDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibSetup()
    }
        
    private func nibSetup() {
        Bundle.main.loadNibNamed("\(HomeHeaderView.self)",
                                 owner: self, options: nil)
        guard let contentView = contentView else { return }
        contentView.frame = self.bounds
        addSubview(contentView)
        setupUI()
    }
    
    func attach(delegate: HomeHeaderDelegate) {
        self.delegate = delegate
    }
}

extension HomeHeaderView {
    private func setupUI() {
        registerCollectionViewCell()
        setupCollectionViewLayout()
    }
    
    private func registerCollectionViewCell() {
        let homeHeaderViewCellNib = UINib(nibName: "\(HomeHeaderViewCell.self)", bundle: nil)
        collectionView.register(homeHeaderViewCellNib, forCellWithReuseIdentifier: "\(HomeHeaderViewCell.self)")
        
        let homeHeaderViewEditCellNib = UINib(nibName: "\(HomeHeaderViewEditCell.self)", bundle: nil)
        collectionView.register(homeHeaderViewEditCellNib, forCellWithReuseIdentifier: "\(HomeHeaderViewEditCell.self)")
    }
    
    private func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 6
        layout.minimumInteritemSpacing = 6
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 19, bottom: 0, right: 0)
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
}

extension HomeHeaderView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 1 : delegate?.headerDatasource.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HomeHeaderViewEditCell.self)", for: indexPath) as? HomeHeaderViewEditCell ?? HomeHeaderViewEditCell()
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HomeHeaderViewCell.self)", for: indexPath) as? HomeHeaderViewCell ?? HomeHeaderViewCell()
            if let item = delegate?.headerDatasource[indexPath.row] {
                cell.setupUI(model: item)
            }
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return delegate?.numberOfSectionsInHeader ?? 0
    }
}

extension HomeHeaderView {
    func notifyDatasourceChanged() {
        collectionView.reloadData()
    }
}
