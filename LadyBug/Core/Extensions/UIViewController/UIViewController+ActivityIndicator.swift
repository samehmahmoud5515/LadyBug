//
//  UIViewController+ActivityIndicator.swift
//  LadyBug
//
//  Created by SAMEH on 13/05/2021.
//

import UIKit

extension UIViewController {

    static let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

    func startLoadingIndicator() {
        let activityIndicator = UIViewController.activityIndicator
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .whiteLarge
        activityIndicator.color = .midGreenTwo
        DispatchQueue.main.async {
            self.view.addSubview(activityIndicator)
        }
        activityIndicator.startAnimating()
    }

    func stopLoadingIndicator() {
        let activityIndicator = UIViewController.activityIndicator
        DispatchQueue.main.async {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }
}
