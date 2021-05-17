//
//  Protocols.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/21/21.
//

import Foundation

protocol ProductDetailsPresenterProtocols {
    var localizer:ProductDetailsLocalizer { get }
    var images: ProductDetailsImages { get }
    var datasource: [ProductDetailsUIModel] { get }
    func attach()
    
}

protocol ProductDetailsViewProtocol : class {
    func stopIndicator()
    func setDataToTableView() -> Products
}

protocol ProductDetailsOtherLinkProtocol : class  {
    func otherLinkButtonDidTapped(_ cell: WebsiteLinkTableViewCell)
}
