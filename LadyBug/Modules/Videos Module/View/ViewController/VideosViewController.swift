//
//  VideosViewController.swift
//  LadyBug
//
//  Created by Sameh on 2/20/21.
//

import UIKit

class VideosViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    //Attribuites
    private var presnter: VideosPresenterProtocol!
    
    init() {
        super.init(nibName: "\(VideosViewController.self)", bundle: nil)
        presnter = VideosPresenter(view: self)
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

}

// MARK:- UI Setup
extension VideosViewController {
    private func setupUI() {
        setupNaviagtionBarUI()
        addSearchBarToNaviagtionBar()
        addBarButtonsToNavigationBar()
        registerTableViewCell()
        setupTableViewRowHeight()
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
        
        let attributes = NSAttributedString(string: presnter.localizer.searchPlaceHolder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.cloudyBlue, NSAttributedString.Key.font: UIFont.get(enFont: .regular(13), arFont: .regular(13))])
        
        if #available(iOS 13.0, *) {
            searchBar.searchTextField.attributedPlaceholder = attributes
        } else {
           let searchField = searchBar.value(forKey: "searchField") as? UITextField
           searchField?.attributedPlaceholder = attributes
        }
    }
    
    private func addBarButtonsToNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: presnter.images.ladyBug), style: .plain, target: nil, action: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: presnter.images.nofication), style: .plain, target: nil, action: nil)
    }
    
    private func registerTableViewCell() {
        let nib = UINib(nibName: "\(VideosCell.self)", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "\(VideosCell.self)")
    }
    
    private func setupTableViewRowHeight() {
        tableView.estimatedRowHeight = 351.0
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension VideosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presnter.postsDatasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(VideosCell.self)", for: indexPath) as? VideosCell ?? VideosCell()
        cell.delegate = self
        presnter.setupCellUI(cell, index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presnter.didTappedCell(with: indexPath.row)
    }
}

extension VideosViewController: VideosCellDelegate {
    
    func openProblemButtonDidTapped(_ cell: VideosCell) {
        if let index = tableView.indexPath(for: cell) {
            print(index)
        }
    }
    
    func likeButtonDidTapped(_ cell: VideosCell) {
        if let index = tableView.indexPath(for: cell) {
            print(index)
        }
    }
    
    func dislikeButtonDidTapped(_ cell: VideosCell) {
        if let index = tableView.indexPath(for: cell) {
            print(index)
        }
    }
    
    func shareButtonDidTapped(_ cell: VideosCell) {
        if let index = tableView.indexPath(for: cell) {
            print(index)
        }
    }
    
    func playButtonDidTapped(_ cell: VideosCell) {
        if let index = tableView.indexPath(for: cell) {
            print(index)
        }
    }
}

extension VideosViewController: VideosViewProtocol {
    func navigateToPostDetails() {
        let vc = ProductDetailsViewController()
        navigationController?.navigationController?.pushViewController(vc, animated: true)
    }
}
