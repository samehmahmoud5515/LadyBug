//
//  ForgotPasswordViewController.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/19/21.
//

import UIKit

class ForgotPasswordViewController: UIViewController, ForgotViewProtocol {
    
    @IBOutlet weak var submitButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var addNumberLabel: UILabel!
    @IBOutlet weak var phoneEmailField: StandardTextFieldView!
    @IBOutlet weak var tryAgainButton: UIButton!
    
    private var presnter: ForgotPresenterProtocol!
    
    init() {
        super.init(nibName: "\(ForgotPasswordViewController.self)", bundle: nil)
        presnter = ForgotPresenter(view: self)
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
    
    private func enableLoginButton() {
        tryAgainButton.isUserInteractionEnabled = true
        tryAgainButton.backgroundColor = UIColor.midGreenTwo
    }
    
    private func disableLoginButton() {
        tryAgainButton.isUserInteractionEnabled = false
        tryAgainButton.backgroundColor = UIColor.lightBlueGrey
    }
    
    @IBAction func tryAgainActionButton(_ sender: UIButton) {
        let vc = CreateNewPasswordViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension ForgotPasswordViewController{
    
    private func setFonts(){
        forgotPasswordLabel.font = UIFont.get(enFont: .bold(28), arFont: .bold(28))
        addNumberLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        tryAgainButton.titleLabel?.font = UIFont.get(enFont: .bold(16), arFont: .bold(16))
    }
}

extension ForgotPasswordViewController: StandardTextFieldViewProtocol {
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

extension ForgotPasswordViewController {
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
extension ForgotPasswordViewController{
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
