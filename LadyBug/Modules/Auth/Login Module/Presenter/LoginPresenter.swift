//
//  LoginPresenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/18/21.
//

import Moya

class LoginPresenter: LoginPresenterProtocol {
    weak var view: LoginViewProtocol?
    var localizer = loginLocalizer()
    var images = LoginImages()
    let provider = MoyaProvider<LoginEndPoint>()
    
    init(view: LoginViewProtocol) {
       self.view = view
    }
    
    func login(with username: String, password: String) {
        provider.request(.login(username: username, password: password)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(moyaResponse):
                do {
                    let loginResponse = try? moyaResponse.map(LoginResponse.self)
                    guard let accessToken = loginResponse?.data?.accessToken else { return }
                    AccessTokenManager.saveAccessToken(token: accessToken)
                    self.view?.navigateToTabBarController()
                } catch {
                    print("Parsing Error")
                }
            case let .failure(error):
                break
            }
        }
    }    
}
