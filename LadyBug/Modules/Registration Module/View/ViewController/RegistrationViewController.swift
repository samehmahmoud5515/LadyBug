//
//  RegistrationViewController.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/19/21.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var registrationImageVew: UIImageView!
    @IBOutlet weak var attachAPictureButton: UIButton!
    @IBOutlet weak var termsAndConditionsButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var userNameView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var chooseYourProfessionView: UIView!
    @IBOutlet weak var PhoneNumerView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordConfirmationView: UIView!
    
    private var presenter: RegistrationPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonFonts()
        // Do any additional setup after loading the view.
    }
    
    
    
    
}
extension RegistrationViewController{
    
    private func setButtonFonts(){
        attachAPictureButton.titleLabel?.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        createAccountButton.titleLabel?.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        termsAndConditionsButton.titleLabel?.font = UIFont.get(enFont: .bold(13), arFont: .bold(13))
    }
    
}
