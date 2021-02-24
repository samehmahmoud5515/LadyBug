//
//  AddPostViewController.swift
//  LadyBug
//
//  Created by SAMEH on 21/02/2021.
//

import UIKit

class AddPostViewController: UIViewController {
    
    @IBOutlet var addPostFooterView: AddPostFooterViewViewController!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addPostButton: UIButton!
    
    //Attribuites
    private var presnter: AddPostPresenterProtocol!
    
    init() {
        super.init(nibName: "\(AddPostViewController.self)", bundle: nil)
        presnter = AddPostPresenter(view: self)
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
extension AddPostViewController {
    private func setupUI() {
        setupNaviagtionBarUI()
        addBarButtonsToNavigationBar()
        registerTableViewCell()
        setupTableViewRowHeight()
        setupAddPostButton()
    }
    
    private func setupNaviagtionBarUI() {
        navigationController?.setNavigationBarHidden(false, animated: false)
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
        button.setImage(UIImage(named: presnter.images.help), for: .normal)
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
        let addPostNib = UINib(nibName: "\(AddPostCell.self)", bundle: nil)
        tableView.register(addPostNib, forCellReuseIdentifier: "\(AddPostCell.self)")
        let descriptionNib = UINib(nibName: "\(AddPostDescriptionCell.self)", bundle: nil)
        tableView.register(descriptionNib, forCellReuseIdentifier: "\(AddPostDescriptionCell.self)")
    }
    
    private func setupTableViewRowHeight() {
        tableView.estimatedRowHeight = 68.0
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setupAddPostButton() {
        addPostButton.backgroundColor = .lightBlueGrey
        addPostButton.setTitleColor(.blueGrey, for: .normal)
        addPostButton.setTitle(presnter.localizer.createPost, for: .normal)
        addPostButton.titleLabel?.font = UIFont.get(enFont: .bold(16), arFont: .bold(16))
    }
}

extension AddPostViewController: AddPostViewProtocol {
    func notifyDataChange() {
        tableView.reloadData()
    }
}

extension AddPostViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presnter.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch presnter.getItemFor(index: indexPath.row) {
        case let .postType(model), let .cropType(model):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(AddPostCell.self)", for: indexPath) as? AddPostCell ?? AddPostCell()
            cell.setupUI(model: model)
            return cell
        case let .Description(model):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(AddPostDescriptionCell.self)", for: indexPath) as? AddPostDescriptionCell ?? AddPostDescriptionCell()
            cell.setupCell(model: model)
            return cell
        }
    }
}

//MARK:- Actions
extension AddPostViewController {
    @objc func didTappedBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
