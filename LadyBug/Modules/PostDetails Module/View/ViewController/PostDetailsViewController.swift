//
//  PostDetailsViewController.swift
//  LadyBug
//
//  Created by SAMEH on 24/03/2021.
//

import UIKit

class PostDetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presnter: PostDetailsPresenterProtocol!
    
    init() {
        super.init(nibName: "\(PostDetailsViewController.self)", bundle: nil)
        presnter = PostDetailsPresenter(view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presnter.attach()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension PostDetailsViewController: PostDetailsViewProtocol {
    
}

extension PostDetailsViewController {
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
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func addBarButtonsToNavigationBar() {
        navigationItem.leftBarButtonItems = [getLeftButton(), getTitleBarButton()]
        
        navigationItem.rightBarButtonItems = [getCheckButton()]
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
    
    private func getCheckButton() -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
        button.setImage(UIImage(named: presnter.images.check), for: .normal)
        button.backgroundColor = .paleGreyThree
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 17
        return UIBarButtonItem(customView: button)
    }
    
    private func registerTableViewCell() {
        let nib1 = UINib(nibName: "\(PostDetailsCell.self)", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: "\(PostDetailsCell.self)")
        
        let nib2 = UINib(nibName: "\(CommentCell.self)", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "\(CommentCell.self)")
    }
    
    private func setupTableViewRowHeight() {
        tableView.estimatedRowHeight = 210
        tableView.rowHeight = UITableView.automaticDimension
    }

}

extension PostDetailsViewController {
    @objc func didTappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension PostDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(PostDetailsCell.self)", for: indexPath) as? PostDetailsCell ?? PostDetailsCell()
            cell.setupUI(localizer: HomeLocalizer())
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(CommentCell.self)", for: indexPath) as? CommentCell ?? CommentCell()
            cell.setupUI()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        } else {
            let headerView = PostDetailsSectionHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 35))
            return headerView
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 35
        }
    }
}
