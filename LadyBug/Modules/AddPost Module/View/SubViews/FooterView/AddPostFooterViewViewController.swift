//
//  AddPostFooterViewViewController.swift
//  LadyBug
//
//  Created by Sameh on 2/23/21.
//

import UIKit

class AddPostFooterViewViewController: UIView {
    @IBOutlet var footerView: UIView!
    @IBOutlet weak var FooterLabelView: UILabel!
    @IBOutlet weak var footerCollectionView: UICollectionView!

    var delegate: AddPostFooterDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibSetup()
    }

    private func nibSetup() {
        Bundle.main.loadNibNamed("\(AddPostFooterViewViewController.self)",
                                 owner: self, options: nil)
        guard let contentView = footerView else { return }
        contentView.frame = self.bounds
        addSubview(contentView)
    }

    func attach(delegate: AddPostFooterDelegate) {
        self.delegate = delegate
    }
}

extension AddPostFooterViewViewController {
    private func setupUI() {
        registerCollectionViewCell()
        setupCollectionViewLayout()
    }

    private func registerCollectionViewCell() {
        let AddPostFooterCellNib = UINib(nibName: "\(AddPostFooterViewCell.self)", bundle: nil)
        footerCollectionView.register(AddPostFooterCellNib, forCellWithReuseIdentifier: "\(AddPostFooterViewCell.self )")

        let addPostFooterView  = UINib(nibName: "\(AddPostFooterViewEditCell.self)", bundle: nil)
        footerCollectionView.register(addPostFooterView, forCellWithReuseIdentifier: "\(AddPostFooterViewEditCell.self)")
    }

    private func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 13
        layout.minimumInteritemSpacing = 13
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        footerCollectionView.setCollectionViewLayout(layout, animated: false)
    }
}

extension AddPostFooterViewViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 1 : delegate?.footerDatasource.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(AddPostFooterViewEditCell.self)", for: indexPath) as? AddPostFooterViewEditCell ?? AddPostFooterViewEditCell()
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(AddPostFooterViewCell.self)", for: indexPath) as? AddPostFooterViewCell ?? AddPostFooterViewCell()
            if let item = delegate?.footerDatasource[indexPath.row] {
                cell.setupUI(model: item)
            }
            return cell
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return delegate?.numberOfSectionsInHeader ?? 0
    }
}

extension AddPostFooterViewViewController {
    func notifyDatasourceChanged() {
        footerCollectionView.reloadData()
    }
}
