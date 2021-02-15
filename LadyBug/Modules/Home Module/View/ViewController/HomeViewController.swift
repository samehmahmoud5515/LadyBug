//
//  HomeViewController.swift
//  LadyBug
//
//  Created by Sameh on 2/15/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var headerView: HomeHeaderView!
    @IBOutlet weak var tableView: UITableView!
    
    //Attribuites
    private var presnter: HomePresenterProtocol!
    private let images = HomeImages()
    private let localizer = HomeLocalizer()
    
    init() {
        super.init(nibName: "\(HomeViewController.self)", bundle: nil)
        presnter = HomePresenter(view: self)
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
extension HomeViewController {
    private func setupUI() {
        setupNaviagtionBarUI()
        addSearchBarToNaviagtionBar()
        addBarButtonsToNavigationBar()
        setupHeaderView()
    }
    
    private func setupNaviagtionBarUI() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func addSearchBarToNaviagtionBar() {
        let searchBar = UISearchBar()
        searchBar.setImage(UIImage(named: images.search), for: .search, state: .normal)
        searchBar.barTintColor = .paleGrey
        searchBar.tintColor = .black
        navigationItem.titleView = searchBar
        
        let attributes = NSAttributedString(string: localizer.searchPlaceHolder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.cloudyBlue, NSAttributedString.Key.font: UIFont.get(enFont: .regular(13), arFont: .regular(13))])
        
        if #available(iOS 13.0, *) {
            searchBar.searchTextField.attributedPlaceholder = attributes
        } else {
           let searchField = searchBar.value(forKey: "searchField") as? UITextField
           searchField?.attributedPlaceholder = attributes
        }
    }
    
    private func addBarButtonsToNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: images.ladyBug), style: .plain, target: nil, action: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: images.nofication), style: .plain, target: nil, action: nil)
    }
    
    private func setupHeaderView() {
        headerView.attach(delegate: presnter)
        headerView.notifyDatasourceChanged()
    }
}

extension HomeViewController: HomeViewProtocol {
    
}
