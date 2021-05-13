//
//  FarmPersonSelectionViewController.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/6/21.
//

import UIKit


class FarmPersonSelectionViewController: UIViewController, FarmPersonSelectionViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    //Attribuites
    private var presnter: FarmPersonSelectionPresenterProtocols!
    
    init() {
        super.init(nibName: "\(FarmPersonSelectionViewController.self)", bundle: nil)
        presnter = FarmPersonSelectionPresenter(view : self )
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
extension FarmPersonSelectionViewController {
    
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
          
          let attributes = NSAttributedString(string: presnter.localizer.farmpersonselectionsearchplaceholdertitle, attributes: [NSAttributedString.Key.foregroundColor : UIColor.cloudyBlue, NSAttributedString.Key.font: UIFont.get(enFont: .regular(13), arFont: .regular(13))])
          
          if #available(iOS 13.0, *) {
              searchBar.searchTextField.attributedPlaceholder = attributes
          } else {
             let searchField = searchBar.value(forKey: "searchField") as? UITextField
             searchField?.attributedPlaceholder = attributes
          }
      }
  
    private func registerTableViewCell() {
        let nib = UINib(nibName: "\(FarmPersonSelectionTableViewCell.self)", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "\(FarmPersonSelectionTableViewCell.self)")
    }
    
    private func setupTableViewRowHeight() {
        tableView.rowHeight = 74
    }
    
}
extension FarmPersonSelectionViewController {
    @objc func didTappedBackButton(){
        self.dismiss(animated: false, completion: nil)
    }
}
extension FarmPersonSelectionViewController :UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(FarmPersonSelectionTableViewCell.self)", for: indexPath) as? FarmPersonSelectionTableViewCell ?? FarmPersonSelectionTableViewCell()
        cell.setupUI()
        return cell
        
    }
}
