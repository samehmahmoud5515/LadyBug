//
//  MoreMenuViewController.swift
//  LadyBug
//
//  Created by Sameh on 2/20/21.
//

import UIKit

class MoreMenuViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presnter: MoreMenuPresenterProtocol!
    
    init() {
        super.init(nibName: "\(MoreMenuViewController.self)", bundle: nil)
        presnter = MoreMenuPresenter(view: self)
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
extension MoreMenuViewController {
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
        button.setImage(UIImage(named: presnter.images.topIcon), for: .normal)
        button.backgroundColor = .paleGreyThree
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 17
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
        let nib = UINib(nibName: "\(MoreMenuProfileCell.self)", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "\(MoreMenuProfileCell.self)")
    }
    
    private func setupTableViewRowHeight() {
        tableView.estimatedRowHeight = 56
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension MoreMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presnter.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch presnter.datasource[indexPath.row] {
        case let .profile(MoreMenuProfileModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MoreMenuProfileCell.self)", for: indexPath) as? MoreMenuProfileCell ?? MoreMenuProfileCell()
            return cell
        case let .notification(notificationModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MoreMenuNotificationsCell.self)", for: indexPath) as? MoreMenuNotificationsCell ?? MoreMenuNotificationsCell()
            return cell
        case let .language(languageModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MoreMenuLanguageCell.self)", for: indexPath) as? MoreMenuLanguageCell ?? MoreMenuLanguageCell()
            return cell
        case let .tasks(tasksModel) :
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MoreMenuTaskesCell.self)", for: indexPath) as? MoreMenuTaskesCell ?? MoreMenuTaskesCell()
            return cell
        case let .products(productsModel) :
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MoreMenuTaskesCell.self)", for: indexPath) as? MoreMenuTaskesCell ?? MoreMenuTaskesCell()
            return cell
        case let .posts(postsModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MoreMenuTaskesCell.self)", for: indexPath) as? MoreMenuTaskesCell ?? MoreMenuTaskesCell()
            return cell
        case let .followers(followersModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MoreMenuTaskesCell.self)", for: indexPath) as? MoreMenuTaskesCell ?? MoreMenuTaskesCell()
            return cell
        case let .interests(interestsModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MoreMenuTaskesCell.self)", for: indexPath) as? MoreMenuTaskesCell ?? MoreMenuTaskesCell()
            return cell
        case let.usageAgreement(usageAgreementModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MoreMenuTaskesCell.self)", for: indexPath) as? MoreMenuTaskesCell ?? MoreMenuTaskesCell()
            return cell
        case let.help(helpModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MoreMenuTaskesCell.self)", for: indexPath) as? MoreMenuTaskesCell ?? MoreMenuTaskesCell()
            return cell
        case let .logOut(logOutModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MoreMenuTaskesCell.self)", for: indexPath) as? MoreMenuTaskesCell ?? MoreMenuTaskesCell()
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presnter.handleCellDidTapped(index: indexPath.row)
    }
}

extension MoreMenuViewController: MoreMenuViewProtocol {
    func naviageteTo(model: MoreMenuUIModel) {
        switch model {
        case .profile:
            break
        case .notification:
            break
        case .language :
            break
        case.tasks,.products,.posts,.followers,.interests,.usageAgreement,.help,.logOut :
            break
        default:
            break
        }
    }
    
    func notifiyDataChange() {
        tableView.reloadData()
    }
}
