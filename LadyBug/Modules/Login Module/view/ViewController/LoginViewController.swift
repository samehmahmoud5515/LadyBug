//
//  LoginViewController.swift
//  LadyBug
//
//  Created by Sameh on 2/14/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var userNameField: StandardTextFieldView!
    @IBOutlet weak var passwordField: StandardTextFieldView!
    @IBOutlet weak var loginImageView: UIImageView!
    @IBOutlet weak var loginTitleLabel: UILabel!
    @IBOutlet weak var loginTitleDescriptionlabel: UILabel!
    @IBOutlet weak var loginWelcomeLabel: UILabel!
    @IBOutlet weak var loginRegistrationLabel: UILabel!
    @IBOutlet weak var loginRegistrationView: UIView!
    @IBOutlet weak var loginPasswordView: UIView!
    @IBOutlet weak var loginNewUserButtontitle: UIButton!
    @IBOutlet weak var loginForgetPasswordTitle: UIButton!
    @IBOutlet weak var loginSignInButtonTitle: UIButton!
    @IBOutlet weak var loginSignByLabel: UILabel!
    @IBOutlet weak var loginFaceBookButtonTitle: UIButton!
    @IBOutlet weak var loginGoogleButtonTitle: UIButton!
    @IBOutlet weak var loginAppleButtonTitle: UIButton!
    
    private var presenter: LoginPresenterProtocol!
    
    init() {
        super.init(nibName: "\(LoginViewController.self)", bundle: nil)
        presenter = LoginPresenter(view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setColor()
        setLabelFonts()
        setButtonFonts()

        userNameField.addMaxCharToTextField(20)
        userNameField.delegate = self
        userNameField.setupUI(isPasswordField: false, placeholder: "user name", nextButton: true)
        
        passwordField.addMaxCharToTextField(20)
        passwordField.delegate = self
        passwordField.setupUI(isPasswordField: true, placeholder: "password", nextButton: false)
        
        observeOnKeyboard()
        hideKeyboardWhenTappedAround()
        
    }
}
extension LoginViewController{
    
    private func setColor(){
        loginTitleLabel.textColor = UIColor.darkishGreen
        loginTitleDescriptionlabel.textColor = UIColor.darkishGreen
        loginWelcomeLabel.textColor = UIColor.purplishBrown
        loginRegistrationLabel.textColor = UIColor.purplishBrown
        loginNewUserButtontitle.setTitleColor(.midGreenTwo, for: .normal)
        loginForgetPasswordTitle.setTitleColor(.midGreenTwo, for: .normal)
        loginSignInButtonTitle.setTitleColor(.white, for: .normal)
        loginSignByLabel.textColor = UIColor.black
        loginFaceBookButtonTitle.setTitleColor(.white, for: .normal)
        loginGoogleButtonTitle.setTitleColor(.white, for: .normal)
        loginAppleButtonTitle.setTitleColor(.white, for: .normal)
        loginFaceBookButtonTitle.backgroundColor = UIColor.frenchBlue
        loginGoogleButtonTitle.backgroundColor = UIColor.paleRed
        loginAppleButtonTitle.backgroundColor = UIColor.black
        loginSignInButtonTitle.backgroundColor = UIColor.lightBlueGrey
        
    }
    
    private func setLabelFonts(){
        loginTitleLabel.font = UIFont.get(enFont: .bold(32), arFont: .bold(32))
        loginTitleDescriptionlabel.font = UIFont.get(enFont: .regular(18), arFont: .regular(18))
        loginWelcomeLabel.font = UIFont.get(enFont: .bold(32), arFont: .bold(32))
        loginRegistrationLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        loginSignByLabel.font = UIFont.get(enFont: .regular(14), arFont: .regular(14))
    }
    
    private func setButtonFonts(){
        loginNewUserButtontitle.titleLabel?.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        loginForgetPasswordTitle.titleLabel?.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        loginSignInButtonTitle.titleLabel?.font = UIFont.get(enFont: .bold(16), arFont: .bold(16))
        loginFaceBookButtonTitle.titleLabel?.font = UIFont.get(enFont: .bold(16), arFont: .bold(16))
        loginGoogleButtonTitle.titleLabel?.font = UIFont.get(enFont: .bold(16), arFont: .bold(16))
        loginAppleButtonTitle.titleLabel?.font = UIFont.get(enFont: .bold(16), arFont: .bold(16))
    }
    
    private func enableLoginButton() {
        loginSignInButtonTitle.isUserInteractionEnabled = true
        loginSignInButtonTitle.backgroundColor = UIColor.midGreenTwo
    }
    
    private func disableLoginButton() {
        loginSignInButtonTitle.isUserInteractionEnabled = false
        loginSignInButtonTitle.backgroundColor = UIColor.lightBlueGrey
    }
}
extension LoginViewController: LoginViewProtocol {
    func navigateToTabBarController() {
        let vc = TabBarViewController()
        navigationController?.viewControllers = [vc]
    }
}

extension LoginViewController: StandardTextFieldViewProtocol {
    func didBeginEditing(_ textField: StandardTextFieldView) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            let point = self?.loginWelcomeLabel.frame.origin
            let updatedPoint = CGPoint(x: 0, y: point?.y ?? 0)
            self?.scrollView.setContentOffset(updatedPoint, animated: true)
        }
        
    }
    
    func didEndEditing(_ textField: StandardTextFieldView) {
        if textField == userNameField {
            if !textField.inputText.isValidUserName {
                textField.displayError("الرجاء كتابة بريد إلكتروني أو رقم هاتف صحيح")
            }
        } else if textField == passwordField {
            if !textField.inputText.isValidPassword {
                textField.displayError("الرجاء كتابة بريد إلكتروني أو رقم هاتف صحيح")
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: StandardTextFieldView) {
        if textField == userNameField {
            passwordField.requestFocus()
        } else if textField == passwordField {
            passwordField.releaseFocus()
        }
    }
    
    func didChangeText(text: String, _ textField: StandardTextFieldView) {
        if passwordField.inputText.isValidPassword && userNameField.inputText.isValidUserName {
            enableLoginButton()
        } else {
            disableLoginButton()
        }
        
        if textField == userNameField {
            userNameField.removeErrorView()
        } else if textField == passwordField {
            passwordField.removeErrorView()
        }
    }
    
}

extension LoginViewController {
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

extension LoginViewController {
    @IBAction func loginButtonDidTapped(_ sender: Any) {
        presenter.login(with: userNameField.inputText, password: passwordField.inputText)
    }
}
