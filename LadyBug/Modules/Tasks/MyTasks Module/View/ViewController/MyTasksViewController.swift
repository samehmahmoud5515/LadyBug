//
//  WeatherViewController.swift
//  LadyBug
//
//  Created by SAMEH on 11/03/2021.
//

import UIKit

class MyTasksViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var presenter: MyTasksPresenterProtocol!
    
    init() {
        super.init(nibName: "\(MyTasksViewController.self)", bundle: nil)
        presenter = MyTasksPresenter(view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startLoadingIndicator()
        presenter.fetchData()
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

extension MyTasksViewController: MyTasksViewControllerProtocol {
    func startLoadingIndicatorView() {
        startLoadingIndicator()
    }
    
    func stopLoadingIndicatorView() {
        stopLoadingIndicator()
    }
    
    func updateData() {
        tableView.reloadData()
        if let weatherData = presenter.weatherData {
            if let view = tableView.tableHeaderView as? MyTasksHeaderView {
                view.updateUI(weatherData: weatherData)
            }
        }
    }
}

extension MyTasksViewController {
    private func setupUI() {
        setupNaviagtionBarUI()
        addBarButtonsToNavigationBar()
        registerTableViewCell()
        setupTableViewRowHeight()
        setupTableViewHeader()
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
        button.setImage(UIImage(named: presenter.images.back), for: .normal)
        button.backgroundColor = .paleGreyThree
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 17
        button.addTarget(self, action: #selector(didTappedBackButton), for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    
    private func getTitleBarButton() -> UIBarButtonItem {
        let titleLabel = UILabel()
        titleLabel.text = presenter.localizer.title
        titleLabel.textColor = .purplishBrown
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.sizeToFit()

        return UIBarButtonItem(customView: titleLabel)
    }
    
    private func registerTableViewCell() {
        let cellNib = UINib(nibName: "\(MyTasksCell.self)", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "\(MyTasksCell.self)")
    }
    
    private func setupTableViewRowHeight() {
        tableView.estimatedRowHeight = 72
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setupTableViewHeader() {
        tableView.tableHeaderView = MyTasksHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 220))
    }

}

extension MyTasksViewController {
    @objc func didTappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension MyTasksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.tasks.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.tasks[section].todayTasks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(MyTasksCell.self)", for: indexPath) as? MyTasksCell ?? MyTasksCell()
        let task = presenter.tasks[indexPath.section].todayTasks?[indexPath.section]

        cell.setupUI(task: task ?? TodayTask())
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = MyTasksSectionHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 35))
        let title = presenter.tasks[section].farmedTypeName
        headerView.setupUI(title: title ?? "")
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard var task = presenter.tasks[indexPath.section].todayTasks?[indexPath.row],
              let taskId = task.id,
              let cell = tableView.cellForRow(at: indexPath) as? MyTasksCell
            else { return }
        task.done = !(task.done ?? false)
        presenter.tasks[indexPath.section].todayTasks?[indexPath.row] = task
        presenter.toggleFinish(taskId: "\(taskId)") { 
            cell.setupUI(task: task)
        }
    }
}
