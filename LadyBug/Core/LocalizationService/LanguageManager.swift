//
//  LanguageManager.swift
//  ERAssistance
//
//  Created by sameh on 9/16/20.
//  Copyright © 2020 Arabian Systems. All rights reserved.
//

import UIKit

fileprivate let APPLE_LANGUAGE_KEY = "AppleLanguages"

class LanguageManager {
    // MARK: - Attributes
    var isArabic: Bool {
        Self.currentLanguage.isRTL
    }
    
    var isRTL: Bool {
        Self.currentLanguage.isRTL
    }
    
    var viewDirection: UISemanticContentAttribute {
        return Self.shared.isRTL ? .forceRightToLeft : .forceLeftToRight
    }
    
    // MARK: - Class Attributes
    static var currentLanguage: Language {
        let currentLanguage = UserDefaults.standard.value(forKey: APPLE_LANGUAGE_KEY) as? [String] ?? ["en", "ar"]
        return Language(rawValue: "\(currentLanguage.first ?? "en")") ?? Language.en
    }
    // MARK: - Init
    private init() {}
    
    static let shared: LanguageManager = LanguageManager()

    // MARK: - Methods
    func setup() {
        if LanguageManager.currentLanguage == .ar {
            setLanguage(language: .ar)
        } else {
            setLanguage(language: .en)
        }
    }
    
    func setLanguage(language: Language) {
        UserDefaults.standard.setValue([language.rawValue], forKey: APPLE_LANGUAGE_KEY)
        setSemanticContentAttribute(semantic: viewDirection)
        LocalizerService.shared.doSwizzling()
        (UIApplication.shared.delegate as? AppDelegate)?.configureRootViewController()
    }
    
    func setDefaultlanguage(language: Language) {
        UserDefaults.standard.setValue([language.rawValue], forKey: APPLE_LANGUAGE_KEY)
        setSemanticContentAttribute(semantic: viewDirection)
        LocalizerService.shared.doSwizzling()
    }
    
    func setSemanticContentAttribute(semantic: UISemanticContentAttribute) {
        UIView.appearance().semanticContentAttribute = semantic
        UIStackView.appearance().semanticContentAttribute = semantic
        UILabel.appearance().semanticContentAttribute = semantic
        UITextView.appearance().semanticContentAttribute = semantic
        UITextField.appearance().semanticContentAttribute = semantic
        UIButton.appearance().semanticContentAttribute = semantic
        UINavigationBar.appearance().semanticContentAttribute = semantic
        UITabBar.appearance().semanticContentAttribute = semantic
        UISearchBar.appearance().semanticContentAttribute = semantic
    }
}
