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
    let provider = MoyaProvider<RegistrationEndpoint>()
    let jobsProvider = MoyaProvider<JobsEndPoint>()
    init(view: RegistrationViewProtocol) {
        self.view = view
    }
    
    func setNewUser(name: String, email: String, mobile: String, password: String, passwordConfirmation: String, humanJobId: String, photo: String) {
        provider.request(.setNewUser(name: name, email: email, mobile: mobile, password: password, passwordConfirmation: passwordConfirmation, humanJobId: humanJobId, photo: photo)) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let registrationResponse = try? moyaResponse.map(RegisterResponse.self)
                    guard let accessToken = registrationResponse?.data?.accessToken else { return }
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
        
        func fetchJobs() {
            jobsProvider.request(.jobs) { result in
                switch result {
                case let .success(moyaResponse):
                    do {
                        let jobsResponse = try? moyaResponse.map(JobsResponse.self)
                        print(jobsResponse)
                        guard let jobs = jobsResponse?.data?.all else { return }
                        self.jobs = jobs
                        self.view?.setselectProfessionSelectionView()
                        print(jobs)
                    } catch {
                        print("Parsing Error")
                    }
                case let .failure(error):
                    break
                }
            }
        }
}
