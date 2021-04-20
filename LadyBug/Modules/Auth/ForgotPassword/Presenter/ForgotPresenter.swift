//
//  ForgotPresenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/19/21.
//

import Moya

class ForgotPresenter: ForgotPresenterProtocol {
    
    weak var view: ForgotViewProtocol?
    
    var images = ForgotImages()
    var localizer = ForgotLocalizer()
    let provider = MoyaProvider<ForgotPasswordEndpoint>()
    
    
    init(view: ForgotViewProtocol) {
        self.view = view
    }
    
    func attach() {
    }
    func forgotPassword( email: String) {
        //        if username == Defaults[.username] && Defaults[.password] == password {
        //            Defaults[.isUserLogged] = true
        //            view?.navigateToTabBarController()
        //        }
        
        provider.request(.forgotPassword( email: email)) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let statusCode = moyaResponse.statusCode
            case let .failure(error):
                break
            }
        }
    }
    
}
