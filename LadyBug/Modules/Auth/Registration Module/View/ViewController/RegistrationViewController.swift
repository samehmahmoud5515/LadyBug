//
//  RegistrationViewController.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/19/21.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var registrationImageVew: UIImageView!
    @IBOutlet weak var attachAPictureButton: UIButton!
    @IBOutlet weak var termsAndConditionsButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var userNameField: StandardTextFieldView!
    @IBOutlet weak var emailField: StandardTextFieldView!
    @IBOutlet weak var selectProfessionSelectionView: StandardSelectionView!
    @IBOutlet weak var mobileField: StandardTextFieldView!
    @IBOutlet weak var passwordField: StandardTextFieldView!
    @IBOutlet weak var retypePasswordField: StandardTextFieldView!
    
    var presenter: RegistrationPresenterProtocol!
    
    init() {
        super.init(nibName: "\(RegistrationViewController.self)", bundle: nil)
        presenter = RegistrationPresenter(view: self)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonFonts()
        setupUI()
        viewSetup()
        termsAndConditionsButton.titleLabel?.numberOfLines = 0
        selectProfessionSelectionView.setupUI(selectionTitle: presenter.localizer.chooseYourProfession)
        observeOnKeyboard()
        hideKeyboardWhenTappedAround()
    }
    private func enableCreateAccountButton() {
        createAccountButton.isUserInteractionEnabled = true
        createAccountButton.backgroundColor = UIColor.midGreenTwo
    }
    private func disableCreateAccountButton() {
        createAccountButton.isUserInteractionEnabled = false
        createAccountButton.backgroundColor = UIColor.lightBlueGrey
    }
}

extension RegistrationViewController: StandardTextFieldViewProtocol {
    func didBeginEditing(_ textField: StandardTextFieldView) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            let point = textField.frame.origin
            let updatedPoint = CGPoint(x: 0, y: point.y)
            self?.scrollView.setContentOffset(updatedPoint, animated: true)
        }
        
    }
    func didEndEditing(_ textField: StandardTextFieldView) {
        if textField == userNameField {
            if !textField.inputText.isValidUserName {
                textField.displayError(presenter.localizer.userNameAlert)
            }
        } else if textField == emailField {
            if !textField.inputText.isValidEmail {
                textField.displayError(presenter.localizer.emailAlert)
            }
        } else if textField == mobileField {
            if !textField.inputText.isValidPhone {
                textField.displayError(presenter.localizer.phoneNumerAlert)
            }
        } else if textField == passwordField {
            if !textField.inputText.isValidPassword {
                textField.displayError(presenter.localizer.passwordAlert)
            }
        } else if textField == retypePasswordField {
            if textField.inputText != passwordField.inputText || passwordField.inputText.isEmpty {
                textField.displayError(presenter.localizer.passwordConfirmationAlert)
            }
        }
    }
    func textFieldShouldReturn(_ textField: StandardTextFieldView) {
        if textField == userNameField {
            emailField.requestFocus()
        } else if textField == emailField {
            mobileField.requestFocus()
        } else if textField == mobileField {
            passwordField.requestFocus()
        } else if textField == passwordField {
            retypePasswordField.requestFocus()
        } else if textField == retypePasswordField {
            retypePasswordField.releaseFocus()
        }
    }
    func didChangeText(text: String, _ textField: StandardTextFieldView) {
        if passwordField.inputText.isValidPassword && userNameField.inputText.isValidUserName &&
            !mobileField.inputText.isEmpty &&
            passwordField.inputText == retypePasswordField.inputText &&
            emailField.inputText.isValidEmail {
            enableCreateAccountButton()
        } else {
            disableCreateAccountButton()
        }
        if textField == userNameField {
            userNameField.removeErrorView()
        } else if textField == passwordField {
            passwordField.removeErrorView()
        } else if textField == mobileField {
            mobileField.removeErrorView()
        } else if textField == emailField {
            emailField.removeErrorView()
        } else if textField == retypePasswordField {
            retypePasswordField.removeErrorView()
        }
    }
    
  
}
extension RegistrationViewController {
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
    private func setupUI() {
        setupNaviagtionBarUI()
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
        button.setImage(UIImage(named: presenter.images.back), for: .normal)
        button.backgroundColor = .paleGreyThree
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 17
        button.addTarget(self, action: #selector(didTappedBackButton), for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    
    private func getTitleBarButton() -> UIBarButtonItem {
        let titleLabel = UILabel()
        titleLabel.text = presenter.localizer.CreateNewAccount
        titleLabel.textColor = .purplishBrown
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.sizeToFit()
        return UIBarButtonItem(customView: titleLabel)
    }
    
    @objc func didTappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension RegistrationViewController: RegistrationViewProtocol {
    
}
extension RegistrationViewController{
    private func viewSetup(){
        userNameFieldView()
        emailFieldView()
        mobileFieldView()
        passwordFieldView()
        retypePasswordFieldView()
        setButtonFonts()
        setupTermsAndCondtionsButton()
    }
    
    private func userNameFieldView(){
        userNameField.addMaxCharToTextField(20)
        userNameField.delegate = self
        userNameField.setupUI(isPasswordField: false, placeholder: presenter.localizer.userName, nextButton: true)
    }
    
    private func emailFieldView(){
        emailField.addMaxCharToTextField(20)
        emailField.delegate = self
        emailField.setupUI(isPasswordField: false, placeholder: presenter.localizer.email, nextButton: true)
    }
    
    private func mobileFieldView(){
        mobileField.addMaxCharToTextField(20)
        mobileField.delegate = self
        mobileField.setupUI(isPasswordField: false, placeholder: presenter.localizer.phoneNumer, nextButton: true)
    }
    
    private func passwordFieldView(){
        passwordField.addMaxCharToTextField(20)
        passwordField.delegate = self
        passwordField.setupUI(isPasswordField: true, placeholder: presenter.localizer.password, nextButton: true)
    }
    
    private func retypePasswordFieldView(){
        retypePasswordField.addMaxCharToTextField(20)
        retypePasswordField.delegate = self
        retypePasswordField.setupUI(isPasswordField: true, placeholder: presenter.localizer.passwordConfirmation, nextButton: false)
    }
    
    private func setButtonFonts() {
        attachAPictureButton.titleLabel?.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        createAccountButton.titleLabel?.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        termsAndConditionsButton.titleLabel?.font = UIFont.get(enFont: .bold(13), arFont: .bold(13))
    }
    
    private func setupTermsAndCondtionsButton() {
        let mutableStrings = NSMutableAttributedString()
        mutableStrings.append(NSAttributedString(string: "بالنقر فوق تسجيل ، فإنك توافق على", attributes: [NSAttributedString.Key.font: UIFont.get(enFont: .regular(13), arFont: .regular(13)), NSAttributedString.Key.foregroundColor: UIColor.black]))
        
        mutableStrings.append(NSAttributedString(string: " الشروط والأحكام", attributes: [NSAttributedString.Key.font: UIFont.get(enFont: .regular(13), arFont: .regular(13)), NSAttributedString.Key.foregroundColor: UIColor.midGreenTwo]))
        
        mutableStrings.append(NSAttributedString(string: " التالية بدون تحفظ", attributes: [NSAttributedString.Key.font: UIFont.get(enFont: .regular(13), arFont: .regular(13)), NSAttributedString.Key.foregroundColor: UIColor.black]))
        termsAndConditionsButton.setAttributedTitle(mutableStrings, for: .normal)
        termsAndConditionsButton.titleLabel?.textAlignment = .center
    }
}

extension RegistrationViewController {
    @IBAction func createAccount(_ sender: UIButton) {
        presenter.registration(name: userNameField.inputText, email: emailField.inputText, mobile: mobileField.inputText, password: passwordField.inputText, passwordConfirmation: retypePasswordField.inputText, humanJobId: "1" , photo: "")
       }
}
