//
//  ForgetPasswordViewController.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/19/21.
//

import UIKit

class ForgetPasswordViewController: UIViewController {
    
    @IBOutlet weak var submitButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var forgetPasswordLabel: UILabel!
    @IBOutlet weak var addNumberLabel: UILabel!
    @IBOutlet weak var phoneEmailField: StandardTextFieldView!
    @IBOutlet weak var tryAgainButton: UIButton!
    
    private var presnter: ForgetPasswordPresenterProtocol!
    
    init() {
        super.init(nibName: "\(ForgetPasswordViewController.self)", bundle: nil)
        presnter = ForgetPasswordPresenter(view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFonts()
        setupUI()
        phoneEmailField.requestFocus()
        phoneEmailField.addMaxCharToTextField(20)
        phoneEmailField.delegate = self
        phoneEmailField.setupUI(isPasswordField: false, placeholder: presnter.localizer.placeholder, nextButton: true)
        observeOnKeyboard()
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func enableLoginButton() {
        tryAgainButton.isUserInteractionEnabled = true
        tryAgainButton.backgroundColor = UIColor.midGreenTwo
    }
    
    private func disableLoginButton() {
        tryAgainButton.isUserInteractionEnabled = false
        tryAgainButton.backgroundColor = UIColor.lightBlueGrey
    }
    
   
    
}
extension ForgetPasswordViewController{
    
    private func setFonts(){
        forgetPasswordLabel.font = UIFont.get(enFont: .bold(28), arFont: .bold(28))
        addNumberLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        tryAgainButton.titleLabel?.font = UIFont.get(enFont: .bold(16), arFont: .bold(16))
    }
}

extension ForgetPasswordViewController: StandardTextFieldViewProtocol {
    func didBeginEditing(_ textField: StandardTextFieldView) {
        
    }
    
    func didEndEditing(_ textField: StandardTextFieldView) {
        if textField == phoneEmailField {
            if !textField.inputText.isValidUserName {
                textField.displayError(presnter.localizer.wrongEmail)
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: StandardTextFieldView) {
        if textField == phoneEmailField {
            phoneEmailField.releaseFocus()
        }
    }
    
    func didChangeText(text: String, _ textField: StandardTextFieldView) {
        if phoneEmailField.inputText.count > 0 {
            enableLoginButton()
        } else {
            disableLoginButton()
        }
        
        if textField == phoneEmailField {
            phoneEmailField.removeErrorView()
        }
    }
    
}

extension ForgetPasswordViewController {
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
extension ForgetPasswordViewController{
    private func setupUI() {
        setupNaviagtionBarUI()
        addBarButtonsToNavigationBar()
    }
    
    private func setupNaviagtionBarUI() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func addBarButtonsToNavigationBar() {
        navigationItem.leftBarButtonItems = [getLeftButton()]
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
    
    @objc func didTappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
extension ForgetPasswordViewController{
    
    @IBAction func tryAgainActionButton(_ sender: UIButton) {
        presnter.forgetPassword(email: phoneEmailField.inputText)
       }
}
extension ForgetPasswordViewController : ForgetPasswordViewProtocol{
    func navigateToCreateNewPassword() {
        let vc = CreateNewPasswordViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
 
