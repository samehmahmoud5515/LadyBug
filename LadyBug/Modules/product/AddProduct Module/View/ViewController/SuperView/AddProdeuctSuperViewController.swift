//
//  AddProdeuctSuperViewController.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/26/21.
//

import UIKit

class AddProdeuctSuperViewController: UIViewController {
   
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
        presnter.getCitysAndCrops()
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
        setupButtonUI()
        hideKeyboardWhenTappedAround()
        tabelDelegateAndDataSourceSet()
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
        button.setImage(UIImage(named: presnter.images.optional), for: .normal)
        button.backgroundColor = .paleGreyThree
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 17
        return UIBarButtonItem(customView: button)
    }
}
extension AddProdeuctSuperViewController{
    
    private func tabelDelegateAndDataSourceSet(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func getTitleBarButton() -> UIBarButtonItem {
        let titleLabel = UILabel()
        titleLabel.text = presnter.localizer.navigationitleAddProduct
        titleLabel.textColor = .purplishBrown
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.sizeToFit()
        
        return UIBarButtonItem(customView: titleLabel)
    }
    
    private func registerTableViewCell() {
        let AddImage = UINib(nibName: "\(AddImageTableViewCell.self)", bundle: nil)
        tableView.register(AddImage, forCellReuseIdentifier: "\(AddImageTableViewCell.self)")
        
        let Describation = UINib(nibName: "\(AddProductDescribationTableViewCell.self)", bundle: nil)
        tableView.register(Describation, forCellReuseIdentifier: "\(AddProductDescribationTableViewCell.self)")
        
        let Selection = UINib(nibName: "\(AddProductSelectionTableViewCell.self)", bundle: nil)
        tableView.register(Selection, forCellReuseIdentifier: "\(AddProductSelectionTableViewCell.self)")
        
        let TextView = UINib(nibName: "\(AddProductTextViewTableViewCell.self)", bundle: nil)
        tableView.register(TextView, forCellReuseIdentifier: "\(AddProductTextViewTableViewCell.self)")
        
    }
    
    private func setupTableViewRowHeight() {
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 147
    }
}

extension AddProdeuctSuperViewController: AddProductViewProtocol {
    func stopIndicator() {
        self.startLoadingIndicator()
    }
    
    func getProductsRelations() {
        
    }
    
     func didSelectItem(item: String) {
        
    }
    
    func notifiyDataChange() {
        tableView.reloadData()
    }
}

extension AddProdeuctSuperViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presnter.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        switch presnter.getItemFor(index: indexPath.row) {
            
        case .addImage(_):
            cell = tableView.dequeueReusableCell(withIdentifier: "\(AddImageTableViewCell.self)", for: indexPath)
            cell.selectionStyle = .none
            if let postCell = cell as? AddImageTableViewCell {
                postCell.setupFontUI()
                setupTableViewRowHeight()
            }
        case let .productTitle(model):
            cell = tableView.dequeueReusableCell(withIdentifier: "\(AddProductDescribationTableViewCell.self)", for: indexPath)
            if let postCell = cell as? AddProductDescribationTableViewCell {
                postCell.setUI(model: model)
                setupTableViewRowHeight()
            }
        case let .appropriateCrop(model):
            cell = tableView.dequeueReusableCell(withIdentifier: "\(AddProductSelectionTableViewCell.self)", for: indexPath)
            
            if let postCell = cell as? AddProductSelectionTableViewCell {
                postCell.setupUI(model: model)
                 self.tableView.rowHeight = 84
            }
        case let .city(model):
            cell = tableView.dequeueReusableCell(withIdentifier: "\(AddProductSelectionTableViewCell.self)", for: indexPath)
            if let postCell = cell as? AddProductSelectionTableViewCell {
                postCell.setupUI(model: model)
                 self.tableView.rowHeight = 84
            }
        case let .region(model):
            cell = tableView.dequeueReusableCell(withIdentifier: "\(AddProductSelectionTableViewCell.self)", for: indexPath)
            if let postCell = cell as? AddProductSelectionTableViewCell {
                postCell.setupUI(model: model)
                 self.tableView.rowHeight = 84
            }
        case let .otherSites(model):
            cell = tableView.dequeueReusableCell(withIdentifier: "\(AddProductSelectionTableViewCell.self)", for: indexPath)
            if let postCell = cell as? AddProductSelectionTableViewCell {
                postCell.setupUI(model: model)
                self.tableView.rowHeight = 84
            }
        case let .description(model):
            cell = tableView.dequeueReusableCell(withIdentifier: "\(AddProductTextViewTableViewCell.self)", for: indexPath)
            if let postCell = cell as? AddProductTextViewTableViewCell {
                postCell.setupUI(textViewUpdateDelegate: self)
                setupTableViewRowHeight()
            }
        case let .phoneNumber(model):
            cell = tableView.dequeueReusableCell(withIdentifier: "\(AddProductDescribationTableViewCell.self)", for: indexPath)
            if let postCell = cell as? AddProductDescribationTableViewCell {
                postCell.setUI(model: model)
                setupTableViewRowHeight()
            }
        case let .price(model):
            cell = tableView.dequeueReusableCell(withIdentifier: "\(AddProductDescribationTableViewCell.self)", for: indexPath)
            if let postCell = cell as? AddProductDescribationTableViewCell {
                postCell.setUI(model: model)
                setupTableViewRowHeight()
            }
        }
        return cell
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
        setupNavigationButton()
    }
    
    private func setupNavigationButton(){
        let product : Products = Products.init()
        let Vc = ProductDetailsViewController(product: product)
        navigationController?.pushViewController(Vc, animated: true)
    }
    
    private func setupButtonUI(){
        addProductButton.titleLabel?.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        addProductButton.titleLabel?.text = presnter.localizer.addProductButton
    }
}

extension AddProdeuctSuperViewController: TextViewUpdateProtocol {
    func textViewChanged() {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}
