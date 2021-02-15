//
//  UIView+Gradient.swift
//  ERAssistance
//
//  Created by sameh on 9/16/20.
//  Copyright © 2020 Arabian Systems. All rights reserved.
//

import UIKit

enum GradientDirection: Int {
    case leftToRight = 0
    case rightToLeft = 1
    case bottomToTop = 2
    case topToBottom = 3
}

extension UIView {
    func gradientBackground(from color1: UIColor, to color2: UIColor, direction: GradientDirection) {
        let gradient = CAGradientLayer()
        let frame = CGRect(origin: bounds.origin, size: CGSize(width: UIScreen.main.bounds.width, height: bounds.size.height))
        gradient.frame = frame
        gradient.colors = [color1.cgColor, color2.cgColor]

        switch direction {
        case .leftToRight:
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        case .rightToLeft:
            gradient.startPoint = CGPoint(x: 1.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 0.0, y: 0.5)
        case .bottomToTop:
            gradient.startPoint = CGPoint(x: 0.5, y: 1.0)
            gradient.endPoint = CGPoint(x: 0.5, y: 0.0)
        case .topToBottom:
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        }

        self.layer.insertSublayer(gradient, at: 0)
    }
}
