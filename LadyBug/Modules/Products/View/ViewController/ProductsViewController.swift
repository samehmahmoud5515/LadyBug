//
//  ProductsViewController.swift
//  LadyBug
//
//  Created by Sameh on 2/20/21.
//

import UIKit

class ProductsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addProductButton: UIButton!
    
    //Attribuites
    private var presnter: ProductsPresenterProtocol!
    var mainMenu = ["ProductDetailsViewController"]
    
    init() {
        super.init(nibName: "\(ProductsViewController.self)", bundle: nil)
        presnter = ProductsPresenter(view: self)
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
extension ProductsViewController {
    private func setupUI() {
        setupNaviagtionBarUI()
        addSearchBarToNaviagtionBar()
        addBarButtonsToNavigationBar()
        registerTableViewCell()
        setupTableViewRowHeight()
        setupTableViewFooter()
        setupAddProductButton()
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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: presnter.images.nofication), style: .plain, target: self, action: #selector(notificationButtonDidTapped))
    }
    
    private func registerTableViewCell() {
        let nib = UINib(nibName: "\(ProductCell.self)", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "\(ProductCell.self)")
    }
    
    private func setupTableViewRowHeight() {
        tableView.estimatedRowHeight = 351.0
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setupTableViewFooter() {
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: addProductButton.bounds.height + 43))
    }
    
    private func setupAddProductButton() {
        addProductButton.setTitle(presnter.localizer.addPost, for: .normal)
        addProductButton.titleLabel?.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
    }
}

extension ProductsViewController: ProductsViewProtocol {
    
}

extension ProductsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presnter.getProductsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProductCell.self)", for: indexPath) as? ProductCell ?? ProductCell()
        cell.setupUI()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let subView = ProductDetailsViewController()
        self.navigationController?.navigationController?.pushViewController(subView, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ProductsViewController {
    @objc func notificationButtonDidTapped() {
        navigationController?.navigationController?.pushViewController(NotificationTabelViewController(), animated: true)
    }
}
