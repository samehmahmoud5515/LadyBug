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
        let nib = UINib(nibName: "\(HomeHeaderViewCell.self)", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "\(HomeHeaderViewCell.self)")
    }
    
    private func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 6
        layout.minimumInteritemSpacing = 6
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 19)
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
}

extension HomeHeaderView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.headerDatasource.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HomeHeaderViewCell.self)", for: indexPath) as? HomeHeaderViewCell ?? HomeHeaderViewCell()
        cell.setupUI()
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return delegate?.numberOfSectionsInHeader ?? 0
    }
}

extension HomeHeaderView: HomeHeaderViewProtocol {
    func notifyDatasourceChanged() {
        collectionView.reloadData()
    }
}
