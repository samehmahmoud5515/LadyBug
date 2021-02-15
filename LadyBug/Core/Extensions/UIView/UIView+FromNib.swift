//
//  UIView+FromNib.swift
//  PublicTowingApp
//
//  Created by AhmedFitoh on 9/6/20.
//  Copyright © 2020 Arabian Systems. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    class func fromNib<T: UIView>() -> T? {
        Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as? T
    }
}
