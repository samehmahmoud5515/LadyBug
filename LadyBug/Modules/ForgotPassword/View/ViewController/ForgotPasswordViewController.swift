//
//  ForgotPasswordViewController.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/19/21.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var addNumberLabel: UILabel!
    @IBOutlet weak var passwordOrPhoneView: UIView!
    @IBOutlet weak var tryAgainButton: UIButton!
    
    private var presnter: ForgotPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setFonts()
        
    }
    
    
    
    
}
extension ForgotPasswordViewController{
    
    private func setFonts(){
        forgotPasswordLabel.font = UIFont.get(enFont: .bold(28), arFont: .bold(28))
        addNumberLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        tryAgainButton.titleLabel?.font = UIFont.get(enFont: .bold(16), arFont: .bold(16))
    }
}
