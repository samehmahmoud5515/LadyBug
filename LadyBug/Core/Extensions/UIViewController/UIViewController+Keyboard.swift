//
//  UIViewController+Keyboard.swift
//  EmiratesParking
//
//  Created by sameh on 8/18/20.
//  Copyright © 2020 mongy. All rights reserved.
//

import UIKit

extension UIViewController {
    @objc func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
