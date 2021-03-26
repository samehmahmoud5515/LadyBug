//
//  FarmActivityView.swift
//  LadyBug
//
//  Created by SAMEH on 25/03/2021.
//

import UIKit

class FarmActivityView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var collectionView: DynamicHeightCollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibSetup()
    }
        
    private func nibSetup() {
        Bundle.main.loadNibNamed("\(FarmActivityView.self)",
                                 owner: self, options: nil)
        guard let contentView = contentView else { return }
        contentView.frame = bounds
        addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
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

extension FarmActivityView {
    private func setupUI() {
        registerCollectionViewCell()
        setupCollectionViewLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        titleLabel.textColor = .purplishBrown
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
    }
    
    private func registerCollectionViewCell() {
        let nib = UINib(nibName: "\(FarmTypeCell.self)", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "\(FarmTypeCell.self)")
    }
    
    private func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 14
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        layout.itemSize = CGSize(width: ((collectionView.bounds.width - 40) / 2), height: 21)
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
}

extension FarmActivityView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FarmTypeCell.self)", for: indexPath) as? FarmTypeCell ?? FarmTypeCell()
        if indexPath.row == 0 {
            cell.setupUI(isSelected: true)
        } else {
            cell.setupUI(isSelected: false)
        }
        return cell
    }
    
    
}

