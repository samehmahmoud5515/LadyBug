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
    @IBOutlet weak var addFarmButton: UIButton!
    let refreshControl = UIRefreshControl()

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
        startLoadingIndicator()
        presnter.fetchUserFarms()
    }
    
}


extension MyFarmViewController  {
    private func setupUI() {
        setupNaviagtionBarUI()
        addSearchBarToNaviagtionBar()
        addBarButtonsToNavigationBar()
        registerTableViewCell()
        setupTableViewRowHeight()
        setupTableViewFooter()
        setupTableViewRefreshControl()
        setupAddFarmButtonFont()
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
        searchBar.delegate = self
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
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(named: presnter.images.nofication), style: .plain, target: self, action: #selector(notificationButtonDidTapped)), UIBarButtonItem(image: UIImage(named: presnter.images.tasks), style: .plain, target: self, action: #selector(archiveButtonDidTapped))]
    }
    
    private func registerTableViewCell() {
        let nib = UINib(nibName: "\(FarmCell.self)", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "\(FarmCell.self)")
    }
    
    private func setupTableViewRowHeight() {
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setupTableViewHeaderView(with weather: WeatherData) {
        let headerView = MyFarmWeatherHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 182))
        headerView.updateViews(with: weather)
        tableView.tableHeaderView = headerView
    }
    
    private func setupTableViewFooter() {
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: addFarmButton.bounds.height + 41))
    }
    
    private func setupTableViewRefreshControl() {
        refreshControl.tintColor = .midGreenTwo
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
           tableView.addSubview(refreshControl)
        tableView.addSubview(refreshControl)
    }
    
    private func setupAddFarmButtonFont() {
        addFarmButton.titleLabel?.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
    }

}

extension MyFarmViewController: MyFarmViewProtocol {
    func stopLoadingIndicatorView() {
        stopLoadingIndicator()
        if refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
    }
    
    func reloadData() {
        tableView.reloadData()
        if let weatherData = presnter.getWeatherData() {
            setupTableViewHeaderView(with: weatherData)
        }
    }
}

extension MyFarmViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presnter.getFarmsDatasourceCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(FarmCell.self)", for: indexPath) as? FarmCell ?? FarmCell()
        cell.setupUI(farm: presnter.getFarms(for: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MyFarmDetailsViewController(farm: presnter.getFarms(for: indexPath.row))
        navigationController?.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MyFarmViewController {
    @IBAction func addFarmButtonDidTapped(_ sender: Any) {
        let vc = CreateFarmViewController()
        navigationController?.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MyFarmViewController {
    @objc func didTappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func archiveButtonDidTapped() {
        navigationController?.navigationController?.pushViewController(ArchiveViewController(), animated: true)
    }
    
    @objc func notificationButtonDidTapped() {
        navigationController?.navigationController?.pushViewController(NotificationTabelViewController(), animated: true)
    }
}


extension MyFarmViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        let vc = SuggestionsViewController()
        navigationController?.navigationController?.pushViewController(vc, animated: true)
        return false
    }
}

extension MyFarmViewController {
    @objc func refreshData(_ sender: AnyObject) {
        presnter.fetchUserFarms()
    }
}
