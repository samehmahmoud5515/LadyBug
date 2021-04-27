//
//  ProfilePresenter.swift
//  LadyBug
//
//  Created by SAMEH on 19/03/2021.
//

import Moya

class ProfilePresenter: ProfilePresenterProtocol {
    
    weak var view: ProfileViewProtocol?
    
    var localizer = ProfileLocalizer()
    
    var images = ProfileImages()
    
    let provider = MoyaProvider<UpdateUserEndPoint>(plugins: [AuthorizableTokenPlugin()])
    
    init(view: ProfileViewProtocol) {
        self.view = view
    }
    
    func attach() {
        
    }
    func updateUser(name: String, email: String,humanJobId: String, photo: String) {
        provider.request(.updateUser(name: name, email: email, humanJobId: humanJobId, photo: photo)) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let registrationResponse = try? moyaResponse.map(UpdateResponse.self)
                    print(registrationResponse)
                    guard let accessToken = registrationResponse?.data?.accessToken else { return }
                    AccessTokenManager.saveAccessToken(token: accessToken)
                } catch {
                    print("Parsing Error")
                }
            case let .failure(error):
                break
            }
        }
    }
}
