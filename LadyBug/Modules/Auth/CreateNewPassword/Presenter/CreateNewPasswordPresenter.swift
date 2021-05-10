//
//  CreateNewPasswordPresenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/14/21.


import Moya
class CreateNewPasswordPresenter : CreateNewPasswordPresenterprotocol  {
    
    var localizer = CreateNewPasswordLocalizer()
    var image =  CreateNewPasswordImages()
    let provider = MoyaProvider<PasswordEndpoint>()
    weak var view : CreateNewPasswordViewProtocol?
    
    init(view : CreateNewPasswordViewProtocol ){
        self.view = view
    }
    
    func attach() {
    }
    func createNewPassword( password: String){
        
        provider.request(.createNewPassword(password: password)) { result in
                          switch result {
                          case let .success(moyaResponse):
                              let data = moyaResponse.data
                              let statusCode = moyaResponse.statusCode
                              self.view?.navigateToLoginController()
                          case let .failure(error):
                              break
                          }
                      }
    }
}
