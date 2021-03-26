//
//  SuggestionsViewController.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/25/21.
//

import UIKit

class SuggestionsViewController: UIViewController, SuggestionsViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var suggestionsHeaderLabel: UILabel!
    //Attribuites
    private var presnter: SuggestionsPresenterProtocol!
    
    init() {
        super.init(nibName: "\(SuggestionsViewController.self)", bundle: nil)
        presnter = SuggestionsPresenter(view : self )
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presnter.attach()
        tableView.delegate = self
        tableView.dataSource = self
    }
}
extension SuggestionsViewController {
    
    private func setupUI() {
        setupNaviagtionBarUI()
        addBarButtonsToNavigationBar()
        addSearchBarToNaviagtionBar()
        registerTableViewCell()
        setupTableViewRowHeight()
        fontsetup()
    }
    private func fontsetup(){
        suggestionsHeaderLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
    }
    private func setupNaviagtionBarUI() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func addBarButtonsToNavigationBar() {
        navigationItem.leftBarButtonItems = [getLeftButton()]
    }
    
    private func getLeftButton() -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
        button.setImage(UIImage(named: presnter.images.back), for: .normal)
        button.backgroundColor = .paleGrey
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
        
        let attributes = NSAttributedString(string: presnter.localizer.searchbarPlaceholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.cloudyBlue, NSAttributedString.Key.font: UIFont.get(enFont: .regular(13), arFont: .regular(13))])
        
        if #available(iOS 13.0, *) {
            searchBar.searchTextField.attributedPlaceholder = attributes
        } else {
            let searchField = searchBar.value(forKey: "searchField") as? UITextField
            searchField?.attributedPlaceholder = attributes
        }
    }
    private func registerTableViewCell() {
        let nib = UINib(nibName: "\(SuggestionsTableViewCell.self)", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "\(SuggestionsTableViewCell.self)")
    }
    
    private func setupTableViewRowHeight() {
        tableView.rowHeight = 90
    }
    
}
extension SuggestionsViewController {
    @objc func didTappedBackButton(){
        navigationController?.popViewController(animated: true)
    }
}
extension SuggestionsViewController :UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presnter.datasource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(SuggestionsTableViewCell.self)", for: indexPath) as? SuggestionsTableViewCell ?? SuggestionsTableViewCell()
        for dataCell in presnter.datasource
        {
            cell.setupUI(model: dataCell)
            return cell
        }
        return cell
    }
    func notifiyDataChange() {
        tableView.reloadData()
    }
}
