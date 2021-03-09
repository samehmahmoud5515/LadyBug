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
