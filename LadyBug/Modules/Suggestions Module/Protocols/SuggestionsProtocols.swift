//
//  SuggestionsProtocols.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/25/21.
//

import Foundation

protocol SuggestionsPresenterProtocol {
    var localizer: SuggestionsLocalizer { get }
    var images: SuggestionsImages { get }
    func getSuggestionsCount() -> Int
    var datasource: [SuggestionsModel] { get }
    func attach()
}

protocol SuggestionsViewProtocol: class {
    func notifiyDataChange()
}
