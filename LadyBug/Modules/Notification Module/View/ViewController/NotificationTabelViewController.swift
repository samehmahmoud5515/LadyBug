//
//  NotificationTabelViewController.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/25/21.
//
import UIKit

class NotificationTabelViewController: UIViewController, NotificationViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    //Attribuites
    private var presnter: NotificationPresenterProtocol!
    
    init() {
        super.init(nibName: "\(NotificationTabelViewController.self)", bundle: nil)
        presnter = NotificationPresenter(view : self )
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
extension NotificationTabelViewController{
    
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
        tableView.rowHeight = 82
    }
}
extension NotificationTabelViewController{
    @objc func didTappedBackButton(){
        navigationController?.popViewController(animated: true)
    }
  

}
extension NotificationTabelViewController :UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(NotificationsCellTableViewCell.self)", for: indexPath) as? NotificationsCellTableViewCell ?? NotificationsCellTableViewCell()
        cell.setupCell()
        return cell
        
    }
}
