//
//  NotificationTabelViewController.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/25/21.
//
import UIKit

class NotificationViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    //Attribuites
    var datasource = [true, false, false, false, false]
    private var presnter: NotificationPresenterProtocol!
    
    init() {
        super.init(nibName: "\(NotificationViewController.self)", bundle: nil)
        presnter = NotificationPresenter(view : self )
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startLoadingIndicator()
        presnter.getNotification()
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
extension NotificationViewController{
    
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
        titleLabel.text = presnter.localizer.notification
        titleLabel.textColor = .purplishBrown
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.sizeToFit()
        
        
        return UIBarButtonItem(customView: titleLabel)
    }
    private func registerTableViewCell() {
        let nib = UINib(nibName: "\(NotificationsCellTableViewCell.self)", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "\(NotificationsCellTableViewCell.self)")
    }
    
    @objc private func setupTableViewRowHeight() {
        tableView.rowHeight = 100
    }
}
extension NotificationViewController{
    @objc func didTappedBackButton(){
        navigationController?.popViewController(animated: true)
    }
    
    
}
extension NotificationViewController :UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  presnter.notifications.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(NotificationsCellTableViewCell.self)", for: indexPath) as? NotificationsCellTableViewCell ?? NotificationsCellTableViewCell()
        cell.setupCell(notification: presnter.notifications[indexPath.row])
        cell.setupSelecttion(isSelected: datasource[indexPath.row])
        print(presnter.notifications[indexPath.row] )
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let id = presnter.notifications[indexPath.row].id else { return }
        let selection = !datasource[indexPath.row]
        datasource[indexPath.row] = selection
        if let cell = tableView.cellForRow(at: indexPath) as? NotificationsCellTableViewCell {
            cell.setupSelecttion(isSelected: selection)
            presnter.readNotification(notificationId: id)
        }
        
        func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath){
            guard let id = presnter.notifications[indexPath.row].id else { return }
            presnter.unreadNotification(notificationId: id)
        }
    }
}
extension NotificationViewController: NotificationViewProtocol{
    func reloadData() {
        tableView.reloadData()
    }
    
    func stopIndicator() {
           self.stopLoadingIndicator()
      }
      
}


