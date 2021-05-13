//
//  ForgetPresenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/19/21.
//

import Moya

class ForgetPasswordPresenter: ForgetPasswordPresenterProtocol {
    
    weak var view: ForgetPasswordViewProtocol?
    var images = ForgetPasswordImages()
    var localizer = ForgetPasswordLocalizer()
    let provider = MoyaProvider<PasswordEndpoint>()
    
    
    init(view: ForgetPasswordViewProtocol) {
        self.view = view
    }
    
    func attach() {
    }
    func forgetPassword( email: String) {
        provider.request(.forgetPassword( email: email)) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let statusCode = moyaResponse.statusCode
                self.view?.navigateToCreateNewPassword()
            case let .failure(error):
                break
            }
        }
    }
    
}
