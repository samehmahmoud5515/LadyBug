//
//  UIView+InterfaceLayoutDirection.swift
//  EmiratesParking
//
//  Created by sameh on 8/22/20.
//  Copyright © 2020 Arabian-Systems. All rights reserved.
//

import UIKit

extension UIView {
    var userInterfaceLayoutDirection: UIUserInterfaceLayoutDirection {
        UIView.userInterfaceLayoutDirection(for: self.semanticContentAttribute)
    }

    var isRTL: Bool {
        userInterfaceLayoutDirection == .rightToLeft
    }

    var isLTR: Bool {
        userInterfaceLayoutDirection == .leftToRight
    }
}
