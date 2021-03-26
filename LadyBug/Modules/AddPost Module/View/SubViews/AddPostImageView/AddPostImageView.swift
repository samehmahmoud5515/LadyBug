//
//  AddPostImageView.swift
//  LadyBug
//
//  Created by SAMEH on 26/03/2021.
//

import UIKit

class AddPostImageView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    weak var textViewUpdateDelegate: TextViewUpdateProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibSetup()
    }
        
    private func nibSetup() {
        Bundle.main.loadNibNamed("\(AddPostImageView.self)",
                                 owner: self, options: nil)
        guard let contentView = contentView else { return }
        contentView.frame = bounds
        addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        setupUI()
    }
}

extension AddPostImageView {
    
    private func setupUI() {
        titleLabel.textColor = .purplishBrown
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        collectionView.delegate = self
        collectionView.dataSource = self
        registerCell()
        setupCollectionViewLayout()
    }
    
    private func registerCell() {
        let nib1 = UINib(nibName: "\(AddPostImageViewCell.self)", bundle: nil)
        collectionView.register(nib1, forCellWithReuseIdentifier: "\(AddPostImageViewCell.self)")
    }
    
    private func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 120, height: collectionView.bounds.height)
        layout.minimumInteritemSpacing = 13
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
}

extension AddPostImageView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(AddPostImageViewCell.self)", for: indexPath) as? AddPostImageViewCell ?? AddPostImageViewCell()
        cell.setupUI()
        return cell
    }
}
