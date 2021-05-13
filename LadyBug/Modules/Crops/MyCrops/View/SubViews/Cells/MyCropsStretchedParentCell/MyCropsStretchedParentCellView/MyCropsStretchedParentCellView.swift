//
//  MyCropsStretchedCellView.swift
//  LadyBug
//
//  Created by SAMEH on 02/03/2021.
//

import UIKit

class MyCropsStretchedParentCellView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibSetup()
    }
        
    private func nibSetup() {
        Bundle.main.loadNibNamed("\(MyCropsStretchedParentCellView.self)",
                                 owner: self, options: nil)
        guard let contentView = contentView else { return }
        contentView.frame = self.bounds
        addSubview(contentView)
        setupUI()
    }
}

extension MyCropsStretchedParentCellView {
    private func setupUI() {
        registerCollectionViewCells()
        setupCollectionViewLayout()
    }
    
    private func registerCollectionViewCells() {
        let nib = UINib(nibName: "\(MyCropsStretchedCell.self)", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "\(MyCropsStretchedCell.self)")
    }
    
    private func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 293, height: collectionView.bounds.height)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 14
        layout.minimumLineSpacing = 14
        layout.sectionInset = UIEdgeInsets(top: 0, left: 11, bottom: 0, right: 0)
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
}

extension MyCropsStretchedParentCellView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MyCropsStretchedCell.self)", for: indexPath) as? MyCropsStretchedCell ?? MyCropsStretchedCell()
        cell.setupUI()
        return cell
    }
    
    
}
