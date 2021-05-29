//
//  YourProductsTabelViewController.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/5/21.
//

import UIKit

class YourProductsTabelViewController: UIViewController{
    
    
    @IBOutlet weak var tableView: UITableView!
    //Attribuites
    private var presnter: YourProductsPresenterProtocol!
    
    init() {
        super.init(nibName: "\(YourProductsTabelViewController.self)", bundle: nil)
        presnter = YourProductsPresenter(view : self )
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startLoadingIndicator()
        presnter.getUserProducts()
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
extension YourProductsTabelViewController: YourProductsViewProtocol {
    func reloadData() {
        tableView.reloadData()
    }
    
    func stopIndicator() {
        self.stopLoadingIndicator()
    }
    
}
extension YourProductsTabelViewController{
    
    private func setupUI() {
        setupNaviagtionBarUI()
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
        navigationItem.leftBarButtonItems = [getLeftButton(), getTitleBarButton()]
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
    
    private func getTitleBarButton() -> UIBarButtonItem {
        let titleLabel = UILabel()
        titleLabel.text = presnter.localizer.navigationitle
        titleLabel.textColor = .purplishBrown
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.sizeToFit()
        
        return UIBarButtonItem(customView: titleLabel)
    }
    private func registerTableViewCell() {
        let nib = UINib(nibName: "\(YourProductsCellTableViewCell.self)", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "\(YourProductsCellTableViewCell.self)")
    }
    
    private func setupTableViewRowHeight() {
        tableView.rowHeight = 106
        
    }
}
extension YourProductsTabelViewController{
    
    @objc func didTappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension YourProductsTabelViewController :UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presnter.userProducts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(YourProductsCellTableViewCell.self)", for: indexPath) as? YourProductsCellTableViewCell ?? YourProductsCellTableViewCell()
        cell.setup(products: presnter.userProducts[indexPath.row])
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let subView = ProductDetailsViewController(product:presnter.userProducts[indexPath.row])
           self.navigationController?.pushViewController(subView, animated: true)
    }
}
