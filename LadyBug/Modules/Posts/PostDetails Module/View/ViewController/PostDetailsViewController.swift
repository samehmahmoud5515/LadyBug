//
//  PostDetailsViewController.swift
//  LadyBug
//
//  Created by SAMEH on 24/03/2021.
//

import UIKit

class PostDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var addCommentView: UIView!
    @IBOutlet weak var addCommentBottomConst: NSLayoutConstraint!
    
    var presnter: PostDetailsPresenterProtocol!
    
    init(post : UserPost) {
        super.init(nibName: "\(PostDetailsViewController.self)", bundle: nil)
        presnter = PostDetailsPresenter(view: self, post: post )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeOnKeyboard()
        setupUI()
        presnter.attach()
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
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
        button.addTarget(self, action: #selector(didTappedCheckButton), for: .touchUpInside)
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
            return presnter.post.comments?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(PostDetailsCell.self)", for: indexPath) as? PostDetailsCell ?? PostDetailsCell()
            cell.delegate = self 
            cell.setupUI(localizer: HomeLocalizer(), postData: presnter.post)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(CommentCell.self)", for: indexPath) as? CommentCell ?? CommentCell()
            cell.delegate = self
            if let model = presnter.post.comments?[indexPath.row]{
                cell.setupUI(comment: model)
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        } else {
            let headerView = PostDetailsSectionHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 35))
            headerView.setCommentNumber(number: presnter.post.comments?.count ?? 0)
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

extension PostDetailsViewController: PostDetailsDelegate {
    
    func openProblemButtonDidTapped(_ cell: PostDetailsCell) {
        let addPostViewController = AddPostViewController()
        navigationController?.pushViewController(addPostViewController, animated: true)
    }
    
    func likeButtonDidTapped(_ cell: PostDetailsCell ) {
        guard let id = presnter.post.id else {return}
        presnter.setLike(postId: id){ [weak self]() in
            guard var model = self?.presnter.post else {return}
            guard let modelReverse = self?.presnter.post.likedByMe else {return}
            model.likedByMe = !modelReverse
            self?.presnter.post = model
            guard let post = self?.presnter.post else {return}
            cell.setupUI(localizer: HomeLocalizer(), postData: post)
        }
    }
    
    func dislikeButtonDidTapped(_ cell: PostDetailsCell) {
        guard let id = presnter.post.id else {return}
        presnter.setDisLike(postId: id){ [weak self]() in
            guard var model = self?.presnter.post else {return}
            guard let modelReverse = self?.presnter.post.dislikedByMe else {return}
            model.dislikedByMe = !modelReverse
            self?.presnter.post = model
            guard let post = self?.presnter.post else {return}
            cell.setupUI(localizer: HomeLocalizer(), postData: post)
        }
    }
    
    func shareButtonDidTapped(_ cell: PostDetailsCell) {
        let objectsToShare = [cell.postImageView , cell.postDescLabel] as [Any]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    
    func playButtonDidTapped(_ cell: PostDetailsCell) {
    }
    
    func postOwnerDidTapped(_ cell: PostDetailsCell) {
    }
}

extension PostDetailsViewController: PostDetailsCommentDelegate {
    
    func likeButtonDidTapped(_ cell: CommentCell) {
        if let index = tableView.indexPath(for: cell) {
            guard let id = presnter.post.comments?[index.row].id else {return}
            presnter.setCommentLike(commentId: id) {
                [weak self]() in
                guard var model = self?.presnter.post.comments?[index.row] else {return}
                guard let modelReverse = self?.presnter.post.comments?[index.row].likedByMe else {return}
                model.likedByMe = !modelReverse
                self?.presnter.post.comments?[index.row] = model
                cell.setupUI(comment: model)
            }
        }
    }
    
    func dislikeButtonDidTapped(_ cell: CommentCell) {
        if let index = tableView.indexPath(for: cell) {
            guard let id = presnter.post.comments?[index.row].id else {return}
            presnter.setCommentDisLike(commentId: id) {
                [weak self]() in
                guard var model = self?.presnter.post.comments?[index.row] else {return}
                guard let modelReverse = self?.presnter.post.comments?[index.row].dislikedByMe else {return}
                model.likedByMe = !modelReverse
                self?.presnter.post.comments?[index.row] = model
                cell.setupUI(comment: model)
            }
        }
    }
}

extension PostDetailsViewController: StandardAlertViewControllerDelegate {
    func confirmButtonDidTapped(for alert: StandardAlertViewController) {
        presnter.solvePost(postId: presnter.post.id ?? 0)
        dismiss(animated: false, completion: nil)
    }
    
    func cancelButtonDidTapped(for alert: StandardAlertViewController) {
        dismiss(animated: false, completion: nil)
    }
}

extension PostDetailsViewController {
    @objc func didTappedCheckButton() {
        let vc = StandardAlertViewController(title: "هل تم حل مشكلتك ؟", message: "", delegate: self)
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: false, completion: nil)
    }
}

extension PostDetailsViewController {
    
    @IBAction func addComment(_ sender: UIButton) {
    }
    
    @IBAction func uploadCommentPhotos(_ sender: UIButton) {
        addImageButtonDidTapped()
    }
}

extension PostDetailsViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate  {
    
    func addImageButtonDidTapped() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
        self.startLoadingIndicator()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
//            registrationGalleryImageVew.contentMode = .scaleAspectFill
//            registrationGalleryImageVew.image = editedImage
//
//        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            registrationGalleryImageVew.contentMode = .scaleAspectFill
//            registrationGalleryImageVew.image = originalImage
//        }
        self.stopLoadingIndicator()
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.stopLoadingIndicator()
        picker.dismiss(animated: true, completion: nil)
    }
}

extension PostDetailsViewController{
    
    func observeOnKeyboard() {
          NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
          NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
      }
      @objc func keyboardWillShow(notification: NSNotification) {
          
          let userInfo = notification.userInfo
          let keyboardFrame = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? .zero
        addCommentBottomConst.constant = keyboardFrame.size.height
        view.layoutIfNeeded()
      }
      @objc func keyboardWillHide(notification: NSNotification) {
        addCommentBottomConst.constant = .zero
        view.layoutIfNeeded()
      }
}
