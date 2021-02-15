//
//  UIViewController+Present.swift
//  PublicTowingApp
//
//  Created by sameh on 9/8/20.
//  Copyright © 2020 Sameh. All rights reserved.
//

import UIKit

extension UIViewController {
    func add(child: UIViewController, to containerView: UIView) {
        addChild(child)
        containerView.addSubview(child.view)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        child.view.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        child.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        child.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        child.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        child.didMove(toParent: self)
    }

    func add(child: UIViewController, to containerView: UIView, inset: UIEdgeInsets) {
        addChild(child)
        containerView.addSubview(child.view)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        child.view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: inset.top).isActive = true
        child.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: inset.bottom).isActive = true
        child.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: inset.left).isActive = true
        child.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: inset.right).isActive = true
        child.didMove(toParent: self)
    }

    func remove() {
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }

    func dismissChildrenViewControllers() {
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}
