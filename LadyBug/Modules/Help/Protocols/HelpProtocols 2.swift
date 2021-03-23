//
//  HelpProtocols.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/19/21.
//

import Foundation
protocol HelpPresenterProtocol: class {
    var localizer : HelpLocalizer{get}
    var image: HelpImages{get}
    func attach()
}
protocol HelpviewProtocol: class {
    
}
