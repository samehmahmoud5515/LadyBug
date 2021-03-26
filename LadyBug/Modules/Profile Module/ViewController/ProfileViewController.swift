//
//  ProfileViewController.swift
//  LadyBug
//
//  Created by SAMEH on 19/03/2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var editButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var userNameField: StandardTextFieldView!
    @IBOutlet weak var emailNameField: StandardTextFieldView!
    @IBOutlet weak var jobSelection: StandardSelectionView!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var addPictureButton: UIButton!
    @IBOutlet weak var createNewPasswordButton: UIButton!
    
    var presenter: ProfilePresenterProtocol!
    
    init() {
        super.init(nibName: "\(ProfileViewController.self)", bundle: nil)
        presenter = ProfilePresenter(view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.attach()
        observeOnKeyboard()
        hideKeyboardWhenTappedAround()
        
        userNameField.delegate = self
        userNameField.setupUI(isPasswordField: false, placeholder: presenter.localizer.username, nextButton: true)
        
        emailNameField.setupUI(isPasswordField: false, placeholder: presenter.localizer.email, nextButton: true)
        emailNameField.delegate = self
        
        jobSelection.setupUI(selectionTitle: "اختر مهنتك")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func createNewPasswordButton(_ sender: UIButton) {
        let createNewPasswordViewController = CreateNewPasswordViewController()
        navigationController?.pushViewController(createNewPasswordViewController, animated: true)
    }
    
}

extension ProfileViewController: ProfileViewProtocol {
    
}

extension ProfileViewController: StandardTextFieldViewProtocol {
    func didBeginEditing(_ textField: StandardTextFieldView) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            let point = self!.emailNameField.frame.origin
            let updatedPoint = CGPoint(x: 0, y: point.y)
            self?.scrollView.setContentOffset(updatedPoint, animated: true)
        }
    }
    
    func didEndEditing(_ textField: StandardTextFieldView) {
        
    }
    
    func textFieldShouldReturn(_ textField: StandardTextFieldView) {
        if textField == userNameField {
            emailNameField.requestFocus()
        } else if textField == emailNameField {
            jobSelection.requestFocus()
        }
    }
    
    func didChangeText(text: String, _ textField: StandardTextFieldView) {
        
    }
    
    
}

// MARK:- UI Setup
extension ProfileViewController {
    private func setupUI() {
        setupNaviagtionBarUI()
        addBarButtonsToNavigationBar()
        setupButtonsFonts()
    }
    
    private func setupNaviagtionBarUI() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
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
    
    private func setupButtonsFonts() {
        updateButton.titleLabel?.font = UIFont.get(enFont: .bold(16), arFont: .bold(16))
        createNewPasswordButton.titleLabel?.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        addPictureButton.titleLabel?.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
    }
    
}

extension ProfileViewController {
    @objc func didTappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension ProfileViewController {
    func observeOnKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {

        let userInfo = notification.userInfo
        let keyboardFrame = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? .zero
        editButtonBottomConstraint.constant = keyboardFrame.size.height
        view.layoutIfNeeded()
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset = .zero
        editButtonBottomConstraint.constant = 20
        view.layoutIfNeeded()
    }
}
