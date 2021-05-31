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
                    let response = try moyaResponse.map(LoginResponse.self)
                    if response.success {
                        if let accessToken = response.data?.accessToken,
                           let userId = response.data?.user?.id {
                            AccessTokenManager.saveAccessToken(token: accessToken)
                            Defaults[.userId] = "\(userId)"
                        }
                        self.view?.navigateToTabBarController()
                    }
                    self.view?.stopIndicator()
                } catch {
                    print("Parsing Error")
                }
            case let .failure(error):
                self.view?.stopIndicator()
            }
        }
    }
}
