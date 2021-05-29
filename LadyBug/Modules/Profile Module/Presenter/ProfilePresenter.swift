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
    var user: User
    
    init(view: ProfileViewProtocol, user: User) {
        self.view = view
        self.user = user
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
                } catch {
                    print("Parsing Error")
                }
            case let .failure(error):
                break
            }
        }
    }
}
