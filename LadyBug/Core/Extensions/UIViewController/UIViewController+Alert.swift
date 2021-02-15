//
//  UIViewController+Alert.swift
//  EmiratesParking
//
//  Created by sameh on 8/23/20.
//  Copyright © 2020 Arabian-Systems. All rights reserved.
//

import UIKit

extension UIViewController {
    func showDefaultAlert(title: String?, message: String?, actionTitle: String?, actionBlock: (() -> Void)? = nil) {
        DispatchQueue.main.async { [weak self] in
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

            let action = UIAlertAction(title: actionTitle, style: .default) { _ in
                alertController.dismiss(animated: true)
                actionBlock?()
            }

            alertController.addAction(action)
            self?.present(alertController, animated: true)
        }
    }
}
