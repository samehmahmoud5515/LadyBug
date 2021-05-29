//
//  MyCropsViewController.swift
//  LadyBug
//
//  Created by SAMEH on 24/02/2021.
//

import UIKit

class MyCropsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cropsHeaderView: MyCropsHeaderView!
    
    var presnter: MyCropsPresenterProtocol!
    
    init() {
        super.init(nibName: "\(MyCropsViewController.self)", bundle: nil)
        presnter = MyCropsPresenter(view: self)
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

}

// MARK:- UI Setup
extension MyCropsViewController {
    private func setupUI() {
        setupNaviagtionBarUI()
        addBarButtonsToNavigationBar()
        registerTableViewCell()
        setupTableViewRowHeight()
        setupTableViewHeaderView()
        addSearchBarToNaviagtionBar()
    }
    
    private func setupNaviagtionBarUI() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func addBarButtonsToNavigationBar() {
        navigationItem.leftBarButtonItems = [getLeftButton()]
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
    private func registerTableViewCell() {
        let strechedNib = UINib(nibName: "\(MyCropsNewsCell.self)", bundle: nil)
        tableView.register(strechedNib, forCellReuseIdentifier: "\(MyCropsNewsCell.self)")
        
        let normalNib = UINib(nibName: "\(FavoriteProductsCell.self)", bundle: nil)
        tableView.register(normalNib, forCellReuseIdentifier: "\(FavoriteProductsCell.self)")
    }
    
    private func setupTableViewRowHeight() {
        tableView.estimatedRowHeight = 95
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setupTableViewHeaderView() {
        let headerView = MyCropsTableViewHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 160))
        tableView.tableHeaderView = headerView
    }
}

extension MyCropsViewController: MyCropsViewProtocol {
    func notifiyHeaderViewDatasourceDidUpdated() {
        cropsHeaderView.attach(delegate: presnter)
        cropsHeaderView.notifyDatasourceChanged()
    }
    
    func notifiyViewDatasourceDidUpdated() {
        tableView.reloadData()
    }
}

//MARK: - Actions
extension MyCropsViewController {
    @objc func didTappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension MyCropsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presnter.cropsDatasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch presnter.cropsDatasource[indexPath.row] {
        case .crops:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MyCropsNewsCell.self)", for: indexPath) as? MyCropsNewsCell ?? MyCropsNewsCell()
            return cell
        case .products:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(FavoriteProductsCell.self)", for: indexPath) as? FavoriteProductsCell ?? FavoriteProductsCell()
            return cell
        }
    }
    
}
