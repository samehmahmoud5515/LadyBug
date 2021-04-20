//
//  CreateNewPasswordPresenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/14/21.
//

import Moya

class CreateNewPasswordPresenter : CreateNewPasswordPresenterPrototocol{
    var localizer = CreateNewPasswordLocalizer()
    var image =  CreateNewPasswordImages()
    let provider = MoyaProvider<CreateNewPasswordEndpoint>()

    weak var view : CreateNewPasswordViewProtocol?

    init(view : CreateNewPasswordViewProtocol ){
           self.view = view
       }
    
    func attach() {
    }
    func CreateNewPassword( password: String, passwordConfirmation: String){
//        if newPassword == Defaults[.username] && Defaults[.password] == confirmNewpassword {
//        Defaults[.isUserLogged] = true
//        view?.navigateToTabBarController()
//    }
        provider.request(.createNewPassword(password: password, passwordConfirmation: passwordConfirmation)) { result in
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
