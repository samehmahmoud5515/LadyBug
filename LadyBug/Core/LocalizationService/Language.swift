//
//  Language.swift
//  EmritesAuction-iOS
//
//  Created by Ahmed Zaki on 11/28/20.
//  Copyright © 2020 Arabian Systems. All rights reserved.
//

import Foundation

public enum Language: String {
    case en
    case ar
    
    var isRTL: Bool {
        switch self {
        case .en:
            return false
        case .ar:
            return true
        }
    }
}
