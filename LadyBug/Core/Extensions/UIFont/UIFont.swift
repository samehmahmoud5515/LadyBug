//
//  UIFont.swift
//  EmritesAuction-iOS
//
//  Created by sameh on 11/4/20.
//  Copyright © 2020 Arabian Systems. All rights reserved.
//

import UIKit

extension UIFont {
    static func get(enFont enInfo: FontStyle, arFont arInfo: FontStyle) -> UIFont {
        let fontName =  LanguageManager.shared.isArabic ?  arInfo.getFontName() : enInfo.getFontName()
        let info = LanguageManager.shared.isArabic ? arInfo : enInfo
        switch info {
        case let .light(size):
            if let font = UIFont(name: fontName, size: size) {
                return font
            }
        case let .regular(size):
            if let font = UIFont(name: fontName, size: size) {
                return font
            }
        case let .bold(size):
            if let font = UIFont(name: fontName, size: size) {
                return font
            }
        case let .black(size):
            if let font = UIFont(name: fontName, size: size) {
                return font
            }
        }

        return UIFont.systemFont(ofSize: UIFont.systemFontSize)
    }
}

enum FontStyle {
    case light(CGFloat)
    case regular(CGFloat)
    case bold(CGFloat)
    case black(CGFloat)
}

extension FontStyle {
    func getFontName() -> String {
        let isRTL = LanguageManager.shared.isArabic
        switch self {
        case .light:
            return isRTL ? "TSRotger-Light" : "TSRotger-Light"
        case .regular:
            return isRTL ? "TSRotger-Regular" : "TSRotger-Regular"
        case .bold:
            return isRTL ? "TSRotger-Bold" : "TSRotger-Bold"
        case .black:
            return isRTL ? "TSRotger-Black" : "TSRotger-Black"
        }
    }
}
