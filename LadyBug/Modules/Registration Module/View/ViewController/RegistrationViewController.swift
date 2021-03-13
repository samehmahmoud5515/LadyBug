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
    
    private var presenter: RegistrationPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonFonts()
       
        termsAndConditionsButton.titleLabel?.numberOfLines = 0
        
        userNameField.addMaxCharToTextField(20)
        userNameField.delegate = self
        userNameField.setupUI(isPasswordField: false, placeholder: "user name", nextButton: true)
        
        emailField.addMaxCharToTextField(20)
        emailField.delegate = self
        emailField.setupUI(isPasswordField: false, placeholder: "email", nextButton: true)
        
        mobileField.addMaxCharToTextField(20)
        mobileField.delegate = self
        mobileField.setupUI(isPasswordField: false, placeholder: "PhoneNumer", nextButton: true)
        
        passwordField.addMaxCharToTextField(20)
        passwordField.delegate = self
        passwordField.setupUI(isPasswordField: true, placeholder: "password", nextButton: true)
        
        retypePasswordField.addMaxCharToTextField(20)
        retypePasswordField.delegate = self
        retypePasswordField.setupUI(isPasswordField: true, placeholder: "password", nextButton: false)
        
        selectProfessionSelectionView.setupUI(selectionTitle: "اختر مهنتك")
        
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
extension RegistrationViewController {
    
    private func setButtonFonts() {
        attachAPictureButton.titleLabel?.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        createAccountButton.titleLabel?.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        termsAndConditionsButton.titleLabel?.font = UIFont.get(enFont: .bold(13), arFont: .bold(13))
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
                textField.displayError("الرجاء كتابة بريد إلكتروني أو رقم هاتف صحيح")
            }
        } else if textField == emailField {
            if !textField.inputText.isValidEmail {
                textField.displayError("الرجاء كتابة بريد إلكتروني أو رقم هاتف صحيح")
            }
        } else if textField == mobileField {
            if !textField.inputText.isValidEmail {
                textField.displayError("الرجاء كتابة بريد إلكتروني أو رقم هاتف صحيح")
            }
        } else if textField == passwordField {
            if !textField.inputText.isValidPassword {
                textField.displayError("الرجاء كتابة بريد إلكتروني أو رقم هاتف صحيح")
            }
        } else if textField == retypePasswordField {
            if textField.inputText != passwordField.inputText || passwordField.inputText.isEmpty {
                textField.displayError("الرجاء كتابة بريد إلكتروني أو رقم هاتف صحيح")
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
}
