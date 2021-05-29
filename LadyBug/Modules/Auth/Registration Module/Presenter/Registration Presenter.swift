//
//  Registration Presenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/19/21.
//

import Moya

class RegistrationPresenter: RegistrationPresenterProtocol{

    weak var view: RegistrationViewProtocol?
    var images = ImageLocalizer()
    var localizer = RegistrationLocalizer()
    var jobs = [JobsInfo]()
    var userImage: MediaUpload?
    let provider = MoyaProvider<RegistrationEndpoint>()
    let jobsProvider = MoyaProvider<JobsEndPoint>()
    init(view: RegistrationViewProtocol) {
        self.view = view
    }
    
    func setNewUser(name: String, email: String, mobile: String, password: String, passwordConfirmation: String, humanJobId: String) {
        provider.request(.setNewUser(name: name, email: email, mobile: mobile, password: password, passwordConfirmation: passwordConfirmation, humanJobId: humanJobId, photo: userImage)) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let registrationResponse = try? moyaResponse.map(RegisterResponse.self)
                    print(registrationResponse?.message as Any)
                    if registrationResponse?.success == true {
                    guard let accessToken = registrationResponse?.data?.accessToken else { return }
                    AccessTokenManager.saveAccessToken(token: accessToken)
                    self.view?.navigateToTabBarController()
                    }
                    self.view?.stopIndicator()
                } catch {
                    self.view?.stopIndicator()
                    print("Parsing Error")
                }
            case let .failure(error):
                print(error)
                self.view?.stopIndicator()
                break
            }
        }
    }
        
        func fetchJobs() {
            jobsProvider.request(.jobs) { result in
                switch result {
                case let .success(moyaResponse):
                    do {
                        let jobsResponse = try? moyaResponse.map(JobsResponse.self)
                        guard let jobs = jobsResponse?.data?.all else { return }
                        self.jobs = jobs
                        self.view?.setselectProfessionSelectionView()
                    } catch {
                        print("Parsing Error")
                    }
                case let .failure(error):
                    break
                }
            }
        }
}
