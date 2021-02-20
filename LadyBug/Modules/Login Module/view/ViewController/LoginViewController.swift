//
//  LoginViewController.swift
//  LadyBug
//
//  Created by Sameh on 2/14/21.
//

import UIKit

class LoginViewController: UIViewController {
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        setColor()
        setLabelFonts()
        setButtonFonts()
//        presenter.viewDidLoad()
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
        loginSignInButtonTitle.setTitleColor(.blueGrey, for: .normal)
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
}

