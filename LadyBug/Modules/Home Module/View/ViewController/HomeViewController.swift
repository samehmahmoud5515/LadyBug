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
    @IBOutlet weak var addPostButton: UIButton!
    
    //Attribuites
    private var presnter: HomePresenterProtocol!
    
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
        registerTableViewCell()
        setupTableViewRowHeight()
        setupTableViewFooter()
        setupAddPostButton()
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
    
    private func setupHeaderView() {
        headerView.attach(delegate: presnter)
        headerView.notifyDatasourceChanged()
    }
    
    private func registerTableViewCell() {
        let nib = UINib(nibName: "\(HomePostsCell.self)", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "\(HomePostsCell.self)")
    }
    
    private func setupTableViewRowHeight() {
        tableView.estimatedRowHeight = 351.0
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setupTableViewFooter() {
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: addPostButton.bounds.height + 43))
    }
    
    private func setupAddPostButton() {
        addPostButton.setTitle(presnter.localizer.addPost, for: .normal)
        addPostButton.titleLabel?.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
    }
}

extension HomeViewController: HomeViewProtocol {
    func navigateToPostDetails() {
        //let vc = PostDetailsViewController(post: nil!)
        //navigationController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func notifyHeaderViewDatasourceChanged() {
        headerView.notifyDatasourceChanged()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presnter.postsDatasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(HomePostsCell.self)", for: indexPath) as? HomePostsCell ?? HomePostsCell()
        cell.delegate = self
        presnter.setupCellUI(cell, index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presnter.didTappedCell(with: indexPath.row)
    }
}

extension HomeViewController: HomePostsCellDelegate {
    func postOwnerDidTapped(_ cell: HomePostsCell) {
        let vc = StarsAlertViewController(title: presnter.localizer.rateTitle, delegate: self)
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: false, completion: nil)
    }
    
    func openProblemButtonDidTapped(_ cell: HomePostsCell) {
        if let index = tableView.indexPath(for: cell) {
            print(index)
        }
    }
    
    func likeButtonDidTapped(_ cell: HomePostsCell) {
        if let index = tableView.indexPath(for: cell) {
            print(index)
        }
    }
    
    func dislikeButtonDidTapped(_ cell: HomePostsCell) {
        if let index = tableView.indexPath(for: cell) {
            print(index)
        }
    }
    
    func shareButtonDidTapped(_ cell: HomePostsCell) {
        if let index = tableView.indexPath(for: cell) {
            print(index)
        }
    }
    
    func playButtonDidTapped(_ cell: HomePostsCell) {
        if let index = tableView.indexPath(for: cell) {
            print(index)
        }
    }
}

//MARK:- Actions
extension HomeViewController {
    @IBAction func didTappedAddPost(_ sender: Any) {
        let addPostViewController = AddPostViewController()
        navigationController?.navigationController?.pushViewController(addPostViewController, animated: true)
    }
    
    @objc func notificationButtonDidTapped() {
        navigationController?.navigationController?.pushViewController(NotificationViewController(), animated: true)
    }
}

extension HomeViewController: StarsAlertViewControllerDelegate {
    func confirmButtonDidTapped(for alert: StarsAlertViewController, with rate: Double) {
        dismiss(animated: false, completion: nil)
    }
    
    func cancelButtonDidTapped(for alert: StarsAlertViewController) {
        dismiss(animated: false, completion: nil)
    }
}
