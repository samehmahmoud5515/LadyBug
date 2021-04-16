//
//  CreateNewPasswordViewController.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/14/21.
//

import UIKit

class CreateNewPasswordViewController: UIViewController, CreateNewPasswordViewProtocol {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var makePassWordHeadLabeltitle: UILabel!
    @IBOutlet weak var sendToUsLabelTitile: UILabel!
    @IBOutlet weak var EmailLabelTitle: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var newPasswordView: StandardTextFieldView!
    @IBOutlet weak var confirmNewPassword: StandardTextFieldView!
    
    private var presnter : CreateNewPasswordPresenterPrototocol!
    
    init() {
        super.init(nibName: "\(CreateNewPasswordViewController.self)", bundle: nil)
        presnter = CreateNewPasswordPresenter(view : self )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        userNameFieldView()
        passwordFieldView()
        observeOnKeyboard()
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        presnter.login(with: newPasswordView.inputText, confirmNewpassword: confirmNewPassword.inputText)
    }
    
    
    
}
extension CreateNewPasswordViewController {
    
    private func setupUI() {
        setupNaviagtionBarUI()
        addBarButtonsToNavigationBar()
        fontSetupUI()
    }
    
    private func setupNaviagtionBarUI() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func addBarButtonsToNavigationBar() {
        navigationItem.leftBarButtonItems = [getLeftButton()]
    }
    
    private func getLeftButton() -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
        button.setImage(UIImage(named: presnter.image.back), for: .normal)
        button.backgroundColor = .paleGreyThree
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 17
        button.addTarget(self, action: #selector(didTappedBackButton), for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    
}
extension CreateNewPasswordViewController {
    @objc func didTappedBackButton(){
        navigationController?.popViewController(animated: true)
    }
}
extension CreateNewPasswordViewController {
    func fontSetupUI(){
        
        makePassWordHeadLabeltitle.font = UIFont.get(enFont: .regular(28), arFont: .regular(28))
        
        sendToUsLabelTitile.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        
        EmailLabelTitle.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        
        doneButton.titleLabel?.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        
    }
    private func enableLoginButton() {
        doneButton.isUserInteractionEnabled = true
        doneButton.backgroundColor = UIColor.midGreenTwo
    }
    
    private func disableLoginButton() {
        doneButton.isUserInteractionEnabled = false
        doneButton.backgroundColor = UIColor.lightBlueGrey
    }
    
}

extension CreateNewPasswordViewController: StandardTextFieldViewProtocol {
    func didBeginEditing(_ textField: StandardTextFieldView) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            let point = self?.makePassWordHeadLabeltitle.frame.origin
            let updatedPoint = CGPoint(x: 0, y: point?.y ?? 0)
            self?.scrollView.setContentOffset(updatedPoint, animated: true)
        }
        
    }
    
    func didEndEditing(_ textField: StandardTextFieldView) {
        if textField == newPasswordView {
            if !textField.inputText.isValidUserName {
                textField.displayError(presnter.localizer.newPassword)
            }
        } else if textField == confirmNewPassword {
            if !textField.inputText.isValidPassword {
                textField.displayError(presnter.localizer.confirmNewPassword)
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: StandardTextFieldView) {
        if textField == confirmNewPassword {
            newPasswordView.requestFocus()
        } else if textField == newPasswordView {
            newPasswordView.releaseFocus()
        }
    }
    
    func didChangeText(text: String, _ textField: StandardTextFieldView) {
        if confirmNewPassword.inputText.isValidPassword && confirmNewPassword.inputText.isValidUserName {
            enableLoginButton()
        } else {
            disableLoginButton()
        }
        
        if textField == confirmNewPassword {
            confirmNewPassword.removeErrorView()
        } else if textField == confirmNewPassword {
            confirmNewPassword.removeErrorView()
        }
    }
    
}
extension CreateNewPasswordViewController {
    func observeOnKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        let userInfo = notification.userInfo
        let keyboardFrame = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? .zero
        scrollView.contentInset.bottom = keyboardFrame.size.height
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset = .zero
    }
}

extension CreateNewPasswordViewController {
    
    private func userNameFieldView(){
        newPasswordView.addMaxCharToTextField(20)
        newPasswordView.delegate = self
        confirmNewPassword.setupUI(isPasswordField: false, placeholder: presnter.localizer.newPassword, nextButton: true)
    }
}
extension CreateNewPasswordViewController {
    
    private func passwordFieldView(){
        confirmNewPassword.addMaxCharToTextField(20)
        confirmNewPassword.delegate = self
        confirmNewPassword.setupUI(isPasswordField: true, placeholder: presnter.localizer.confirmNewPassword, nextButton: false)
        
    }
}
extension CreateNewPasswordViewController {
    func navigateToTabBarController() {
        let vc = TabBarViewController()
        navigationController?.viewControllers = [vc]
    }
}
