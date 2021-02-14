//
//  LoginViewController.swift
//  LadyBug
//
//  Created by Sameh on 2/14/21.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    @IBAction func buttonDidTapped(_ sender: Any) {
        if LanguageManager.shared.isArabic {
            LanguageManager.shared.setLanguage(language: .en)
        } else {
            LanguageManager.shared.setLanguage(language: .ar)
        }
    }
    
}
