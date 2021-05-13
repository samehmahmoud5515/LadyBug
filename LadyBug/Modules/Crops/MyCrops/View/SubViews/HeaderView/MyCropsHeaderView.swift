//
//  MyCropsHeaderView.swift
//  LadyBug
//
//  Created by SAMEH on 24/02/2021.
//

import UIKit

class MyCropsHeaderView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var delegate: MyCropsHeaderDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibSetup()
    }
        
    private func nibSetup() {
        Bundle.main.loadNibNamed("\(MyCropsHeaderView.self)",
                                 owner: self, options: nil)
        guard let contentView = contentView else { return }
        contentView.frame = self.bounds
        addSubview(contentView)
        setupUI()
    }
    
    func attach(delegate: MyCropsHeaderDelegate) {
        self.delegate = delegate
    }
}

extension MyCropsHeaderView {
    private func setupUI() {
        registerCollectionViewCell()
        setupCollectionViewLayout()
    }
    
    private func registerCollectionViewCell() {
        let headerViewCellNib = UINib(nibName: "\(MyCropsHeaderViewCropCell.self)", bundle: nil)
        collectionView.register(headerViewCellNib, forCellWithReuseIdentifier: "\(MyCropsHeaderViewCropCell.self)")
        
        let headerViewEditCellNib = UINib(nibName: "\(MyCropsHeaderViewEditCell.self)", bundle: nil)
        collectionView.register(headerViewEditCellNib, forCellWithReuseIdentifier: "\(MyCropsHeaderViewEditCell.self)")
    }
    
    private func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 13
        layout.minimumInteritemSpacing = 13
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 19, bottom: 0, right: 0)
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
}

extension MyCropsHeaderView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.headerDatasource[section].numberOfItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = delegate?.headerDatasource[indexPath.section] else { return UICollectionViewCell() }
        
        switch section {
        case .edit:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MyCropsHeaderViewEditCell.self)", for: indexPath) as? MyCropsHeaderViewEditCell ?? MyCropsHeaderViewEditCell()
            return cell
        case let .crops(items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MyCropsHeaderViewCropCell.self)", for: indexPath) as? MyCropsHeaderViewCropCell ?? MyCropsHeaderViewCropCell()
            cell.setupUI(with: items[indexPath.row])
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return delegate?.headerDatasource.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let section = delegate?.headerDatasource[indexPath.section] else { return }
        switch section {
        case .edit:
            break
        case .crops(_):
            if let cell = collectionView.cellForItem(at: indexPath) as? MyCropsHeaderViewCropCell {
                delegate?.didTapItemInHeaderView(cell: cell, index: indexPath.row)
            }
        }
    }
}

extension MyCropsHeaderView {
    func notifyDatasourceChanged() {
        collectionView.reloadData()
    }
}
