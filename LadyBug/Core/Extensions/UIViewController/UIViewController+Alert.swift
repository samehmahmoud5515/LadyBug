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
    
    func showTwoButtonsAlert(title: String?, message: String?, firstActionTitle: String?, firstAction: (() -> Void)? = nil, secondActionTitle: String?, secondAction: (() -> Void)? = nil) {
        DispatchQueue.main.async { [weak self] in
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

            let firstAlertAction = UIAlertAction(title: firstActionTitle, style: .default) { _ in
                alertController.dismiss(animated: true)
                firstAction?()
            }
            
            let secondAlertAction = UIAlertAction(title: secondActionTitle, style: .default) { _ in
                alertController.dismiss(animated: true)
                secondAction?()
            }

            alertController.addAction(firstAlertAction)
            alertController.addAction(secondAlertAction)
            self?.present(alertController, animated: true)
        }
    }
}
