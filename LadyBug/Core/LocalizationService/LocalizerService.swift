//
//  LocalizerService.swift
//  EmritesAuction-iOS
//
//  Created by Ahmed Zaki on 11/28/20.
//  Copyright © 2020 Arabian Systems. All rights reserved.
//

import UIKit

// MARK: - Swizzling
class LocalizerService: NSObject {
    // MARK: - Init
    private override init() {}
    static let shared = LocalizerService()
    
    // MARK: - Swizzling Method
    func doSwizzling() {
        swizzkingNSBundle()
        swizzlingUIApplication()
        swizzlingUILabel()
        swizzlingUITextField()
        swizzlingUITextView()
        swizzlingUIImageView()
    }
    private static func methodSwizzleGivenClassName(cls: AnyClass, originalSelector: Selector, overrideSelector: Selector) {
        let origMethod: Method = class_getInstanceMethod(cls, originalSelector)!
        let overrideMethod: Method = class_getInstanceMethod(cls, overrideSelector)!
        if (class_addMethod(cls, originalSelector, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod))) {
            class_replaceMethod(cls, overrideSelector, method_getImplementation(origMethod), method_getTypeEncoding(origMethod))
        } else {
            method_exchangeImplementations(origMethod, overrideMethod)
        }
    }
    
    func getPreferredLocale() -> Locale {
        guard let preferredIdentifier = Locale.preferredLanguages.first else {
            return Locale.current
        }
        return Locale(identifier: preferredIdentifier)
    }

    
    private func swizzlingUITextField() {
        Self.methodSwizzleGivenClassName(cls: UITextField.self,
                                         originalSelector: #selector(UITextField.awakeFromNib),
                                         overrideSelector: #selector(UITextField.customAwakeFromNib))
    }
    
    private func swizzlingUITextView() {
        Self.methodSwizzleGivenClassName(cls: UITextView.self,
                                         originalSelector: #selector(UITextView.awakeFromNib),
                                         overrideSelector: #selector(UITextView.customAwakeFromNib))
    }
    
    private func swizzlingUILabel() {
        Self.methodSwizzleGivenClassName(cls: UILabel.self,
                                         originalSelector: #selector(UILabel.awakeFromNib),
                                         overrideSelector: #selector(UILabel.customAwakeFromNib))
    }
    
    private func swizzlingUIImageView() {
        Self.methodSwizzleGivenClassName(cls: UIImageView.self,
                                         originalSelector: #selector(UIImageView.awakeFromNib),
                                         overrideSelector: #selector(UIImageView.customAwakeFromNib))
    }
    
    private func swizzlingUIApplication() {
        Self.methodSwizzleGivenClassName(
            cls: UIApplication.self,
            originalSelector: #selector(getter: UIApplication.userInterfaceLayoutDirection),
            overrideSelector: #selector(getter: UIApplication.customUserInterfaceLayoutDirection)
        )
    }
    
    private func swizzkingNSBundle() {
        Self.methodSwizzleGivenClassName(cls: Bundle.self, originalSelector: #selector(Bundle.localizedString(forKey:value:table:)), overrideSelector: #selector(Bundle.customLocalizatedString(forKey:value:table:)))
    }
    
}

// MARK: - UIApplication
extension UIApplication {
    @objc var customUserInterfaceLayoutDirection: UIUserInterfaceLayoutDirection {
        get {
            return LanguageManager.currentLanguage.isRTL ?  .rightToLeft :  .leftToRight
        }
    }
}

// MARK: - UIImageView
extension UIImageView {
    @objc func customAwakeFromNib() {
        super.awakeFromNib()
        if LanguageManager.shared.isRTL && tag < 0 {
            image = image?.imageFlippedForRightToLeftLayoutDirection()
        }
    }
}

// MARK: - UITextField
extension UITextField {
    @objc func customAwakeFromNib() {
        super.awakeFromNib()
        if textAlignment == .center || textAlignment == .justified { return }
        textAlignment = LanguageManager.shared.isRTL ? .right : .left
        
    }
}


// MARK: - UILabel
extension UILabel {
    @objc func customAwakeFromNib() {
        super.awakeFromNib()
        if textAlignment == .center { return }
        textAlignment = LanguageManager.shared.isRTL ? .right : .left
    }
}

// MARK: - Bundle
extension Bundle {
    @objc func customLocalizatedString(forKey key: String, value: String?, table tableName: String?) -> String {
        let selectedLanguage = LanguageManager.currentLanguage.rawValue
        guard let path = Bundle.main.path(forResource: selectedLanguage, ofType: "lproj"), let bundle = Bundle(path: path) else {
            return Bundle.main.customLocalizatedString(forKey: key, value: value, table: tableName)
        }
        //print("KEY: \(key) Value: \(value)")
        return bundle.customLocalizatedString(forKey: key, value: value, table: tableName)
    }
}

// MARK: UITextView
extension UITextView {
    @objc func customAwakeFromNib() {
        super.awakeFromNib()
        if textAlignment == .center { return }
        textAlignment = LanguageManager.shared.isRTL ? .right : .left
    }

}

extension UICollectionViewFlowLayout {
    open override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        return LanguageManager.shared.isArabic
    }
}
