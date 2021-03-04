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

}

// MARK:- UI Setup
extension MyCropsViewController {
    private func setupUI() {
        setupNaviagtionBarUI()
        addBarButtonsToNavigationBar()
        registerTableViewCell()
        setupTableViewRowHeight()
        setupTableViewHeaderView()
    }
    
    private func setupNaviagtionBarUI() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
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
        titleLabel.text = presnter.localizer.title
        titleLabel.textColor = .purplishBrown
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.sizeToFit()

        return UIBarButtonItem(customView: titleLabel)
    }
    
    private func registerTableViewCell() {
        let strechedNib = UINib(nibName: "\(MyCropsStretchedParentCell.self)", bundle: nil)
        tableView.register(strechedNib, forCellReuseIdentifier: "\(MyCropsStretchedParentCell.self)")
        
        let normalNib = UINib(nibName: "\(MyCropsParentCell.self)", bundle: nil)
        tableView.register(normalNib, forCellReuseIdentifier: "\(MyCropsParentCell.self)")
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
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return presnter.cropsDatasource.count
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch presnter.cropsDatasource[indexPath.row] {
        case .crops:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MyCropsStretchedParentCell.self)", for: indexPath) as? MyCropsStretchedParentCell ?? MyCropsStretchedParentCell()
            return cell
        case .products:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MyCropsParentCell.self)", for: indexPath) as? MyCropsParentCell ?? MyCropsParentCell()
            return cell
        }
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = MyCropsTableViewSectionHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 52))
//        headerView.setupUI()
//        return headerView
//    }
//
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        if let view = view as? MyCropsTableViewSectionHeaderView {
//            view.frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 52)
//            view.setupUI()
//        }
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 52
//    }
    
    
}
