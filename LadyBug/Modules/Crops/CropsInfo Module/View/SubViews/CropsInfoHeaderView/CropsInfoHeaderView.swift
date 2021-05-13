//
//  CropsInfoHeaderView.swift
//  LadyBug
//
//  Created by SAMEH on 12/03/2021.
//

import UIKit

class CropsInfoHeaderView: UIView {

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
        Bundle.main.loadNibNamed("\(CropsInfoHeaderView.self)",
                                 owner: self, options: nil)
        guard let contentView = contentView else { return }
        contentView.frame = self.bounds
        addSubview(contentView)
        setupUI()
    }

}

extension CropsInfoHeaderView {
    private func setupUI() {
        registerCollectionViewCell()
        setupCollectionViewLayout()
    }
    
    private func registerCollectionViewCell() {
        let nib = UINib(nibName: "\(CropsInfoHeaderViewCell.self)", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "\(CropsInfoHeaderViewCell.self)")
    }
    
    private func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
}
 
extension CropsInfoHeaderView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CropsInfoHeaderViewCell.self)", for: indexPath) as? CropsInfoHeaderViewCell ?? CropsInfoHeaderViewCell()
        if indexPath.row == 0 {
            cell.setupUI(isSelected: true)
        } else {
            cell.setupUI(isSelected: false)
        }
        return cell
    }
    
    
}
