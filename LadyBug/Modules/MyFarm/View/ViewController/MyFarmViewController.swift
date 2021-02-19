//
//  MyFarmViewController.swift
//  LadyBug
//
//  Created by Sameh on 2/16/21.
//

import UIKit

class MyFarmViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    private var presnter: MyFarmPresenterProtocol!
    
    init() {
        super.init(nibName: "\(MyFarmViewController.self)", bundle: nil)
        presnter = MyFarmPresenter(view: self)
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

extension MyFarmViewController {
    private func setupUI() {
        setupNaviagtionBarUI()
        addSearchBarToNaviagtionBar()
        addBarButtonsToNavigationBar()
        registerTableViewCell()
        setupTableViewRowHeight()
        setupTableViewHeaderView()
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
        
        let attributes = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor : UIColor.cloudyBlue, NSAttributedString.Key.font: UIFont.get(enFont: .regular(13), arFont: .regular(13))])
        
        if #available(iOS 13.0, *) {
            searchBar.searchTextField.attributedPlaceholder = attributes
        } else {
           let searchField = searchBar.value(forKey: "searchField") as? UITextField
           searchField?.attributedPlaceholder = attributes
        }
    }
    
    private func addBarButtonsToNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: presnter.images.ladyBug), style: .plain, target: nil, action: nil)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(named: presnter.images.nofication), style: .plain, target: nil, action: nil), UIBarButtonItem(image: UIImage(named: presnter.images.tasks), style: .plain, target: nil, action: nil)]
    }
    
    private func registerTableViewCell() {
        let nib = UINib(nibName: "\(FarmCell.self)", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "\(FarmCell.self)")
    }
    
    private func setupTableViewRowHeight() {
        tableView.estimatedRowHeight = 110
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setupTableViewHeaderView() {
        let headerView = MyFarmWeatherHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableHeaderView = headerView
        
        headerView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 0).isActive = true
        headerView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: 0).isActive = true
        headerView.widthAnchor.constraint(equalTo: tableView.widthAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 0).isActive = true
        let constraint = headerView.heightAnchor.constraint(equalToConstant: 50)
            constraint.priority = UILayoutPriority(250)
            constraint.isActive = true
    }

}

extension MyFarmViewController: MyFarmViewProtocol {
    
}

extension MyFarmViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presnter.getFarmsDatasourceCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(FarmCell.self)", for: indexPath) as? FarmCell ?? FarmCell()
        cell.setupUI()
        return cell
    }
}
