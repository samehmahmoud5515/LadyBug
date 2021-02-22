//
//  CropsSelectionViewController.swift
//  LadyBug
//
//  Created by SAMEH on 22/02/2021.
//

import UIKit

class InterestedSelectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nextViewContainer: UIView!
    
    var presnter: InterestedSelectionPresenterProtocol!
    let margin: CGFloat = 22
    let cellsPerRow = 3
    
    init() {
        super.init(nibName: "\(InterestedSelectionViewController.self)", bundle: nil)
        presnter = InterestedSelectionPresenter(view: self)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presnter.attach()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let collectionView = collectionView, let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        flowLayout.minimumInteritemSpacing = 33
        let marginsAndInsets = flowLayout.sectionInset.left + flowLayout.sectionInset.right + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + flowLayout.minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
        let extractedExpr: CGFloat = CGFloat(cellsPerRow)
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / extractedExpr).rounded(.down)
        flowLayout.itemSize =  CGSize(width: itemWidth, height: itemWidth)
    }

}

// MARK:- UI Setup
extension InterestedSelectionViewController {
    private func setupUI() {
        setupNaviagtionBarUI()
        addSearchBarToNaviagtionBar()
        addBarButtonsToNavigationBar()
        setupNextViews()
        registerCollectionViewCell()
        setupCollectionViewLayout()
    }
    
    private func setupNaviagtionBarUI() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func addSearchBarToNaviagtionBar() {
        let searchBar = UISearchBar()
        searchBar.setImage(UIImage(named: presnter.images.search), for: .search, state: .normal)
        searchBar.barTintColor = .paleGrey
        searchBar.tintColor = .black
        navigationItem.titleView = searchBar
        
        let attributes = NSAttributedString(string: presnter.localizer.searchTitle, attributes: [NSAttributedString.Key.foregroundColor : UIColor.cloudyBlue, NSAttributedString.Key.font: UIFont.get(enFont: .regular(13), arFont: .regular(13))])
        
        if #available(iOS 13.0, *) {
            searchBar.searchTextField.attributedPlaceholder = attributes
        } else {
           let searchField = searchBar.value(forKey: "searchField") as? UITextField
           searchField?.attributedPlaceholder = attributes
        }
    }
    
    private func addBarButtonsToNavigationBar() {
        navigationItem.leftBarButtonItem = getLeftButton()
    }
    
    private func getLeftButton() -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
        button.setImage(UIImage(named: presnter.images.back), for: .normal)
        button.backgroundColor = .paleGreyThree
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 17
        button.addTarget(self, action: #selector(didTappedBackButton), for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    
    private func setupNextViews() {
        nextLabel.font = UIFont.get(enFont: .regular(14), arFont: .regular(14))
        nextLabel.textColor = .purplishBrown
        nextLabel.text = presnter.localizer.nextTitle
        
        nextButton.titleLabel?.font = UIFont.get(enFont: .bold(16), arFont: .bold(16))
        nextButton.titleLabel?.textColor = .white
        nextButton.setTitle(presnter.localizer.next, for: .normal)
    }
    
    private func registerCollectionViewCell() {
        let cellNib = UINib(nibName: "\(InterestedSelectionCell.self)", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "\(InterestedSelectionCell.self)")
        
        let headerNib = UINib(nibName: "\(InterestedSelectionHeaderView.self)", bundle: nil)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(InterestedSelectionHeaderView.self)")
    }
    
    private func setupCollectionViewLayout() {
        guard let collectionView = collectionView, let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }

        flowLayout.minimumInteritemSpacing = margin
        flowLayout.minimumLineSpacing = margin
        flowLayout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        flowLayout.headerReferenceSize = CGSize(width: collectionView.bounds.width, height: 32)
        flowLayout.scrollDirection = .vertical
    }
    
    private func setupCollectionViewFooter() {
        
    }
}

extension InterestedSelectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return presnter.datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presnter.datasource[section].numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(InterestedSelectionCell.self)", for: indexPath) as? InterestedSelectionCell ?? InterestedSelectionCell()
        cell.setupUI(model: presnter.datasource[indexPath.section].data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(InterestedSelectionHeaderView.self)", for: indexPath) as? InterestedSelectionHeaderView ?? InterestedSelectionHeaderView()
        headerView.frame.size.height = 32
        headerView.setupUI(with: presnter.datasource[indexPath.section].title)
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        view.frame.size.height = 32
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? InterestedSelectionCell {
            presnter.didSelectItemAt(row: indexPath.row, section: indexPath.section, cell: cell)
            collectionView.reloadItems(at: [indexPath])
        }
    }
}

extension InterestedSelectionViewController: InterestedSelectionViewProtocol {
    func notifyDatasourceChanged() {
        collectionView.reloadData()
    }
}

extension InterestedSelectionViewController {
    @objc func didTappedBackButton() {
        
    }
}
