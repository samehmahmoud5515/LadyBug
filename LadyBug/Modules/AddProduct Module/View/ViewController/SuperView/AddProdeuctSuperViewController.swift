//
//  AddProdeuctSuperViewController.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/26/21.
//

import UIKit

class AddProdeuctSuperViewController: UIViewController, AddProductViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addProductButton: UIButton!
    
    private var presnter: AddProductPresenterProtocol!
    
    init() {
           super.init(nibName: "\(AddProdeuctSuperViewController.self)", bundle: nil)
           presnter = AddProductPresenter(view: self)
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
extension AddProdeuctSuperViewController {
    private func setupUI() {
        setupNaviagtionBarUI()
        addBarButtonsToNavigationBar()
        registerTableViewCell()
        setupTableViewRowHeight()
    }
    
    private func setupNaviagtionBarUI() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func addBarButtonsToNavigationBar() {
        navigationItem.leftBarButtonItems = [getLeftButton(), getTitleBarButton()]
        
        navigationItem.rightBarButtonItem = getRightButton()
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
    
    private func getRightButton() -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
        button.setImage(UIImage(named: presnter.images.share), for: .normal)
        button.backgroundColor = .paleGreyThree
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 17
        return UIBarButtonItem(customView: button)
    }
    
    private func getTitleBarButton() -> UIBarButtonItem {
        let titleLabel = UILabel()
        titleLabel.text = "اضف منتج"
        titleLabel.textColor = .purplishBrown
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.sizeToFit()

        return UIBarButtonItem(customView: titleLabel)
    }
    
    private func registerTableViewCell() {
        let nib1 = UINib(nibName: "\(AddImageTableViewCell.self)", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: "\(AddImageTableViewCell.self)")
        
    }
    
    private func setupTableViewRowHeight() {
        tableView.estimatedRowHeight = 147
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension AddProdeuctSuperViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presnter.datasource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
       cell = tableView.dequeueReusableCell(withIdentifier: "\(AddImageTableViewCell.self)", for: indexPath)
       if let postCell = cell as? AddImageTableViewCell {
           postCell.setupFontUI()
       }
        return cell
    
}
}

extension AddProdeuctSuperViewController {
    func notifiyDataChange(){
        tableView.reloadData()
    }
}

extension AddProdeuctSuperViewController{
       func naviageteTo(model: AddProductUIModel) {
       }
}
//MARK:- Actions
extension AddProdeuctSuperViewController {
    @objc func didTappedBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
extension AddProdeuctSuperViewController {
    @IBAction func AddProductActionButton(_ sender: UIButton) {
       }
}
