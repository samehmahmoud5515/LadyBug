//
//  YourProductsTabelViewController.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/5/21.
//

import UIKit

import UIKit

class YourProductsTabelViewController: UIViewController, YourProductsViewProtocol {
    
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
        setupUI()
        presnter.attach()
        tableView.delegate = self
        tableView.dataSource = self
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
extension YourProductsTabelViewController :UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(YourProductsCellTableViewCell.self)", for: indexPath) as? YourProductsCellTableViewCell ?? YourProductsCellTableViewCell()
        cell.setupUI()
        return cell
        
    }
}
