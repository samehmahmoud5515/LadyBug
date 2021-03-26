//
//  CropsInfoViewController.swift
//  LadyBug
//
//  Created by SAMEH on 12/03/2021.
//

import UIKit

class CropsInfoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: CropsInfoPresenterProtocol!
    
    init() {
        super.init(nibName: "\(CropsInfoViewController.self)", bundle: nil)
        presenter = CropsInfoPresenter(view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.attach()

    }
   

}

extension CropsInfoViewController: CropsInfoViewProtocol {
    
}

extension CropsInfoViewController {
    private func setupUI() {
        setupNaviagtionBarUI()
        addBarButtonsToNavigationBar()
        registerTableViewCell()
        setupTableViewRowHeight()
        setupHeaderView()
    }
    
    private func setupNaviagtionBarUI() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func addBarButtonsToNavigationBar() {
        navigationItem.leftBarButtonItems = [getLeftButton(), getTitleBarButton()]
        
        navigationItem.rightBarButtonItems = [getCropButton()]
    }
    
    private func getLeftButton() -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
        button.setImage(UIImage(named: presenter.images.back), for: .normal)
        button.backgroundColor = .paleGreyThree
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 17
        button.addTarget(self, action: #selector(didTappedBackButton), for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    
    private func getTitleBarButton() -> UIBarButtonItem {
        let titleLabel = UILabel()
        titleLabel.text = "محصول التفاح"
        titleLabel.textColor = .purplishBrown
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.sizeToFit()

        return UIBarButtonItem(customView: titleLabel)
    }
    
    private func getCropButton() -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
        button.setImage(UIImage(named: presenter.images.smallApple), for: .normal)
        button.backgroundColor = .lightPeach
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 17
        return UIBarButtonItem(customView: button)
    }
    
    private func registerTableViewCell() {
        let nib1 = UINib(nibName: "\(CropsInfoCell.self)", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: "\(CropsInfoCell.self)")
    }
    
    private func setupTableViewRowHeight() {
        tableView.rowHeight = 100
    }
    
    private func setupHeaderView() {
        let headerView = CropsInfoHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 74))
        tableView.tableHeaderView = headerView
    }

}

extension CropsInfoViewController {
    @objc func didTappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension CropsInfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CropsInfoCell.self)", for: indexPath) as? CropsInfoCell ?? CropsInfoCell()
        cell.setupUI()
        return cell
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(CropsInfoDetailsViewController(), animated: true)
    }
    
}

