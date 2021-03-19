//
//  MyFarmDetailsViewController.swift
//  LadyBug
//
//  Created by SAMEH on 04/03/2021.
//

import UIKit

class MyFarmDetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presnter: MyFarmDetailsPresenterProtocol!
    
    init() {
        super.init(nibName: "\(MyFarmDetailsViewController.self)", bundle: nil)
        presnter = MyFarmDetailsPresenter(view: self)
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

extension MyFarmDetailsViewController {
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
        
        navigationItem.rightBarButtonItems = [getFilterButton(), getTasksButton()]
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
        titleLabel.text = presnter.localizer.title
        titleLabel.textColor = .purplishBrown
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.sizeToFit()

        return UIBarButtonItem(customView: titleLabel)
    }
    
    private func getTasksButton() -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
        button.setImage(UIImage(named: presnter.images.tasks), for: .normal)
        button.backgroundColor = .paleGreyThree
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 17
        return UIBarButtonItem(customView: button)
    }
    
    private func getFilterButton() -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
        button.setImage(UIImage(named: presnter.images.filter), for: .normal)
        button.backgroundColor = .paleGreyThree
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 17
        return UIBarButtonItem(customView: button)
    }
    
    private func registerTableViewCell() {
        let nib1 = UINib(nibName: "\(MyFarmDetailsCell.self)", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: "\(MyFarmDetailsCell.self)")
        
        let nib2 = UINib(nibName: "\(MyFarmDetailsNameCell.self)", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "\(MyFarmDetailsNameCell.self)")
        
        let nib3 = UINib(nibName: "\(MyFarmDetailsSuitabilityCell.self)", bundle: nil)
        tableView.register(nib3, forCellReuseIdentifier: "\(MyFarmDetailsSuitabilityCell.self)")
        
        let nib4 = UINib(nibName: "\(MyFarmDetailsPeopleCell.self)", bundle: nil)
        tableView.register(nib4, forCellReuseIdentifier: "\(MyFarmDetailsPeopleCell.self)")
        
        let nib5 = UINib(nibName: "\(MyFarmDetailsPostsTableViewCell.self)", bundle: nil)
        tableView.register(nib5, forCellReuseIdentifier: "\(MyFarmDetailsPostsTableViewCell.self)")

        let nib6 = UINib(nibName: "\(MyFarmDetailsServiceTableCell.self)", bundle: nil)
        tableView.register(nib6, forCellReuseIdentifier: "\(MyFarmDetailsServiceTableCell.self)")
    }
    
    private func setupTableViewRowHeight() {
        tableView.estimatedRowHeight = 210
        tableView.rowHeight = UITableView.automaticDimension
    }

}

extension MyFarmDetailsViewController: MyFarmDetailsViewProtocol {
    
}

extension MyFarmDetailsViewController {
    @objc func didTappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension MyFarmDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presnter.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch presnter.datasource[indexPath.row] {
        case .name:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MyFarmDetailsNameCell.self)", for: indexPath) as? MyFarmDetailsNameCell ?? MyFarmDetailsNameCell()
            cell.setupUI()
            return cell
        case .details:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MyFarmDetailsCell.self)", for: indexPath) as? MyFarmDetailsCell ?? MyFarmDetailsCell()
            
            return cell
        case .suitability:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MyFarmDetailsSuitabilityCell.self)", for: indexPath) as? MyFarmDetailsSuitabilityCell ?? MyFarmDetailsSuitabilityCell()
            cell.setupUI()
            return cell
        case .people:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MyFarmDetailsPeopleCell.self)", for: indexPath) as? MyFarmDetailsPeopleCell ?? MyFarmDetailsPeopleCell()
            cell.setupUI()
            cell.delegate = self
            return cell
        case .posts:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MyFarmDetailsPostsTableViewCell.self)", for: indexPath) as? MyFarmDetailsPostsTableViewCell ?? MyFarmDetailsPostsTableViewCell()
            cell.setupUI()
            cell.layoutSubviews()
            return cell
        case .tasks:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MyFarmDetailsServiceTableCell.self)", for: indexPath) as? MyFarmDetailsServiceTableCell ?? MyFarmDetailsServiceTableCell()
            cell.setupUI()
            cell.layoutSubviews()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if presnter.datasource[indexPath.row] == .tasks {
            let vc = StandardAlertViewController(title: "هل تريد ارشفة المزرعة ؟", message: "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديدصورة حقيقية لتصميم الموقع.", delegate: self)
            vc.modalPresentationStyle = .overCurrentContext
            present(vc, animated: false, completion: nil)
        }
    }
    
    
}

extension MyFarmDetailsViewController: MyFarmDetailsPeopleCellDelegate {
    func addPeopleButtonDidTapped(_ cell: MyFarmDetailsPeopleCell) {
        if let index = tableView.indexPath(for: cell), presnter.datasource[index.row] == .people {
            let vc = AddPeopleToYourFarmViewController()
            vc.modalPresentationStyle = .overCurrentContext
            present(vc, animated: false, completion: nil)
        }
    }
}

extension MyFarmDetailsViewController: StandardAlertViewControllerDelegate {
    func confirmButtonDidTapped(for alert: StandardAlertViewController) {
        dismiss(animated: false, completion: nil)
    }
    
    func cancelButtonDidTapped(for alert: StandardAlertViewController) {
        dismiss(animated: false, completion: nil)
    }
}
