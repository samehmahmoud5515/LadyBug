//
//  UIView+RoundCorners.swift
//  EmiratesParking
//
//  Created by sameh on 8/20/20.
//  Copyright © 2020 Arabian-Systems. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
