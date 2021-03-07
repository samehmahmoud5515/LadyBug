//
//  UILabel.swift
//  ERAssistance
//
//  Created by sameh on 9/20/20.
//  Copyright © 2020 Arabian Systems. All rights reserved.
//

import UIKit

extension UILabel {
    func changeLinesSpacing(lineHeight: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight
        paragraphStyle.alignment = textAlignment

        let attrString = NSMutableAttributedString()
        if self.attributedText != nil {
            attrString.append(self.attributedText!)
        } else {
            guard let font = font else { return }
            guard let text = text else { return }
            attrString.append(NSMutableAttributedString(string: text))
            attrString.addAttribute(NSAttributedString.Key.font, value: font, range: NSMakeRange(0, attrString.length))
        }
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        self.attributedText = attrString
    }
}
