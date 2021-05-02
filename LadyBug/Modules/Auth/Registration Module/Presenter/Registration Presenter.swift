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
    var jobId = [Int] ()
    var jobName = [String] ()
    let provider = MoyaProvider<RegistrationEndpoint>()
    let jobsProvider = MoyaProvider<JobsEndPoint>()
    init(view: RegistrationViewProtocol) {
        self.view = view
    }
    
    func registering(name: String, email: String, mobile: String, password: String, passwordConfirmation: String, humanJobId: String, photo: String) {
        provider.request(.registration(name: name, email: email, mobile: mobile, password: password, passwordConfirmation: passwordConfirmation, humanJobId: humanJobId, photo: photo)) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let registrationResponse = try? moyaResponse.map(RegisterResponse.self)
                    print(registrationResponse)
                    guard let accessToken = registrationResponse?.data?.accessToken else { return }
                    AccessTokenManager.saveAccessToken(token: accessToken)
                    self.view?.navigateToTabBarController()
                    print(accessToken)
                } catch {
                    print("Parsing Error")
                }
            case let .failure(error):
                break
            }
        }
    }
        
        func setJobs() {
            jobsProvider.request(.jobs) { result in
                switch result {
                case let .success(moyaResponse):
                    do {
                        let jobsResponse = try? moyaResponse.map(JobsResponse.self)
                        print(jobsResponse)
                        guard let jobs = jobsResponse?.data?.all else { return }
                        for job in jobs{
                            print(job.name)
                            self.jobName.append(job.name!)
                            print(job.id)
                            self.jobId.append(job.id!)
                            
                        }
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
