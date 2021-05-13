//
//  MyFarmDetailsView.swift
//  LadyBug
//
//  Created by SAMEH on 04/03/2021.
//

import UIKit

class MyFarmDetailsView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var collectionView: DynamicHeightCollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibSetup()
    }
        
    private func nibSetup() {
        Bundle.main.loadNibNamed("\(FarmDetailsView.self)",
                                 owner: self, options: nil)
        guard let contentView = contentView else { return }
        contentView.frame = bounds
        addSubview(contentView)
        
        setupUI()
        observeOnCollectionViewContentSize()
    }
    
    private func observeOnCollectionViewContentSize() {
        collectionView.addObserver(self, forKeyPath: "contentSize", options: [.new, .old, .initial, .prior], context: nil)
    }
    
    override func observeValue(forKeyPath _: String?, of _: Any?, change _: [NSKeyValueChangeKey: Any]?, context _: UnsafeMutableRawPointer?) {
        self.layoutIfNeeded()
    }
}

extension MyFarmDetailsView {
    private func setupUI() {
        registerCollectionViewCell()
        setupCollectionViewLayout()
    }
    
    private func registerCollectionViewCell() {
        let cell = UINib(nibName: "\(FarmDetailsCell.self)", bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: "\(FarmDetailsCell.self)")
    }
    
    private func setupCollectionViewLayout() {

        let cellsPerRow = 3
        
        guard let collectionView = collectionView, let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        let marginsAndInsets = flowLayout.sectionInset.left + flowLayout.sectionInset.right + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + flowLayout.minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
        let extractedExpr: CGFloat = CGFloat(cellsPerRow)
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / extractedExpr).rounded(.down)
        flowLayout.itemSize = CGSize(width: itemWidth, height: 30)
        //flowLayout.estimatedItemSize = CGSize(width: 1,height: 1)
    }
    
}

extension MyFarmDetailsView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FarmDetailsCell.self)", for: indexPath) as? FarmDetailsCell ?? FarmDetailsCell()
        cell.updateUI()
        return cell
    }
    
    
}
