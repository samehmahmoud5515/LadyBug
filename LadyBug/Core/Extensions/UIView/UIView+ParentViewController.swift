//
//  UIView+ParentViewController.swift
//  LadyBug
//
//  Created by SAMEH on 26/03/2021.
//

import UIKit

extension UIView {
    var parentViewController: UIViewController? {
        weak var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
