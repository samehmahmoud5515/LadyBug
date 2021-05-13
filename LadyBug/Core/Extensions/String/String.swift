//
//  String.swift
//  LadyBug
//
//  Created by Sameh on 2/15/21.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment:"")
    }
    
    var isValidPassword: Bool {
        return trimmingCharacters(in: .whitespaces).count >= 3 && !contains(" ")
    }
    
    var isValidUserName: Bool {
        return trimLeadingAndTrailingSpaces.count > 0 && !trimLeadingAndTrailingSpaces.contains(" ")
    }
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    var isValidPhone :  Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: self)
    }
}

extension String {
    var trimTrailingSpaces: String {
        if let range = rangeOfCharacter(from: .whitespacesAndNewlines, options: [.anchored, .backwards]) {
            return String(self[..<range.lowerBound]).trimTrailingSpaces
        }
        return self
    }
    
    var trimLeadingSpaces: String {
        guard let index = firstIndex(where: { !CharacterSet(charactersIn: String($0)).isSubset(of: .whitespaces) }) else {
            return self
        }
        return String(self[index...])
    }
    
    var trimLeadingAndTrailingSpaces: String {
        trimLeadingSpaces.trimTrailingSpaces
    }
}
