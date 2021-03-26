//
//  CreateNewPasswordViewController.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/14/21.
//

import UIKit

class CreateNewPasswordViewController: UIViewController, CreateNewPasswordViewProtocol {
    @IBOutlet weak var submitButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var makePassWordHeadLabeltitle: UILabel!
    @IBOutlet weak var sendToUsLabelTitile: UILabel!
    @IBOutlet weak var EmailLabelTitle: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var passwordField: StandardTextFieldView!
    @IBOutlet weak var retypePasswordField: StandardTextFieldView!
    
    private var presenter : CreateNewPasswordPresenterPrototocol!
    
    init() {
        super.init(nibName: "\(CreateNewPasswordViewController.self)", bundle: nil)
        presenter = CreateNewPasswordPresenter(view : self )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        observeOnKeyboard()
        hideKeyboardWhenTappedAround()
    }
    private func enableCreateAccountButton() {
           doneButton.isUserInteractionEnabled = true
           doneButton.backgroundColor = UIColor.midGreenTwo
       }
       private func disableCreateAccountButton() {
           doneButton.isUserInteractionEnabled = false
           doneButton.backgroundColor = UIColor.lightBlueGrey
       }
    @IBAction func doneButton(_ sender: UIButton) {
       let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    func navigateToTabBarController() {
           
    }
}

extension CreateNewPasswordViewController {
    
    private func setupUI() {
        setupNaviagtionBarUI()
        addBarButtonsToNavigationBar()
        fontSetupUI()
        viewSetup()
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
        button.setImage(UIImage(named: presenter.image.back), for: .normal)
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
               let point = textField.frame.origin
               let updatedPoint = CGPoint(x: 0, y: point.y)
               self?.scrollView.setContentOffset(updatedPoint, animated: true)
           }
           
       }
       func didEndEditing(_ textField: StandardTextFieldView) {
         
           if textField == passwordField {
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
        if textField == passwordField {
               retypePasswordField.requestFocus()
           } else if textField == retypePasswordField {
               retypePasswordField.releaseFocus()
           }
       }
       func didChangeText(text: String, _ textField: StandardTextFieldView) {
           if passwordField.inputText.isValidPassword &&
               passwordField.inputText == retypePasswordField.inputText 
            {
               enableCreateAccountButton()
           }else {
               disableCreateAccountButton()
           }
           if textField == retypePasswordField {
               retypePasswordField.removeErrorView()
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
        submitButtonBottomConstraint.constant = keyboardFrame.size.height
        view.layoutIfNeeded()
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset = .zero
        submitButtonBottomConstraint.constant = 30
        view.layoutIfNeeded()
    }
}
extension CreateNewPasswordViewController{
private func viewSetup(){
    passwordFieldView()
    retypePasswordFieldView()
}
private func passwordFieldView(){
       passwordField.addMaxCharToTextField(20)
       passwordField.delegate = self
    passwordField.setupUI(isPasswordField: true, placeholder:presenter.localizer.password, nextButton: true)
   }
   
   private func retypePasswordFieldView(){
       retypePasswordField.addMaxCharToTextField(20)
       retypePasswordField.delegate = self
    retypePasswordField.setupUI(isPasswordField: true, placeholder: presenter.localizer.passwordConfirmation, nextButton: false)
   }
}
