//
//  MyPostsViewController.swift
//  LadyBug
//
//  Created by Sameh on 2/20/21.
//

import UIKit

class MyPostsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    //Attribuites
    private var presnter: MyPostsPresenterProtocol!
    
    init() {
        super.init(nibName: "\(MyPostsViewController.self)", bundle: nil)
        presnter = MyPostsPresenter(view: self)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presnter.getUserPosts()
        setupUI()
        presnter.attach()
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

// MARK:- UI Setup
extension MyPostsViewController {
    private func setupUI() {
        setupNaviagtionBarUI()
        registerTableViewCell()
        setupTableViewRowHeight()
        addBarButtonsToNavigationBar()
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
        titleLabel.text = presnter.localizer.navigationTitle
        titleLabel.textColor = .purplishBrown
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.sizeToFit()
        
        return UIBarButtonItem(customView: titleLabel)
    }
    
    
    
    private func registerTableViewCell() {
        let nib = UINib(nibName: "\(MyPostsCell.self)", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "\(MyPostsCell.self)")
    }
    
    private func setupTableViewRowHeight() {
        tableView.estimatedRowHeight = 351.0
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension MyPostsViewController {
    @objc func didTappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension MyPostsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presnter.myPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(MyPostsCell.self)", for: indexPath) as? MyPostsCell ?? MyPostsCell()
        cell.delegate = self
        presnter.setupCellUI(cell, index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presnter.didTappedCell(with: indexPath.row)
    }
}

extension MyPostsViewController: MyPostsCellDelegate {
    
    func openProblemButtonDidTapped(_ cell: MyPostsCell) {
        if let index = tableView.indexPath(for: cell) {
            print(index)
        }
    }
    
    func likeButtonDidTapped(_ cell: MyPostsCell) {
        if let index = tableView.indexPath(for: cell) {
            if presnter.myPosts[index.row].likedByMe == true{
                cell.likeButton.setImage(UIImage(named: presnter.images.like), for: .normal)
                cell.likeButton.backgroundColor = .midGreenTwo
            }else if presnter.myPosts[index.row].likedByMe == false {
                cell.likeButton.setImage(UIImage(named: presnter.images.likeGrey), for: .normal)
                cell.likeButton.backgroundColor = .blueyGrey
            }
        }
    }
    
    func dislikeButtonDidTapped(_ cell: MyPostsCell) {
        if let index = tableView.indexPath(for: cell) {
            if presnter.myPosts[index.row].likedByMe == true{
                cell.dislikeButton.setImage(UIImage(named: presnter.images.dislikeRed), for: .normal)
                cell.dislikeButton.backgroundColor = .tomatoRed
            }else if presnter.myPosts[index.row].likedByMe == false {
                cell.dislikeButton.setImage(UIImage(named: presnter.images.dislike), for: .normal)
                cell.dislikeButton.backgroundColor = .blueyGrey
            }
        }
    }
    
    func shareButtonDidTapped(_ cell: MyPostsCell) {
        if let index = tableView.indexPath(for: cell) {
            let objectsToShare = [cell.postImageView , cell.postDescLabel] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    func playButtonDidTapped(_ cell: MyPostsCell) {
        if let index = tableView.indexPath(for: cell) {
            print(index)
        }
    }
}

extension MyPostsViewController : MyPostsViewProtocol{
    func reloadData() {
        tableView.reloadData()
    }
    
    func stopIndicator() {
        self.stopLoadingIndicator()
    }
}
