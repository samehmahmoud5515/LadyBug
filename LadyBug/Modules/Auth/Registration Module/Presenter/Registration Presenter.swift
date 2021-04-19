//
//  Registration Presenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/19/21.
//

import Moya

class RegistrationPresenter: RegistrationPresenterProtocol {
    
    
    
    weak var view: RegistrationViewProtocol?
    var images = ImageLocalizer()
    var localizer = RegistrationLocalizer()
    let provider = MoyaProvider<RegistrationEndpoint>()

     init(view: RegistrationViewProtocol) {
        self.view = view
     }

    func registration(name: String, email: String, mobile: String, password: String, passwordConfirmation: String, humanJobId: String, photo: String) {
        
        provider.request(.registration(name: name, email: email, mobile: mobile, password: password, passwordConfirmation: passwordConfirmation, humanJobId: humanJobId, photo: photo)) { result in
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
    

