//
//  MyTasksPresenter.swift
//  LadyBug
//
//  Created by SAMEH on 11/03/2021.
//

import Foundation
import Moya

class MyTasksPresenter: MyTasksPresenterProtocol {
    var images = MyTasksImages()
    var localizer = MyTasksLocalizer()
    weak var view: MyTasksViewControllerProtocol?
    let provider = MoyaProvider<TasksEndPoint>(plugins: [AuthorizableTokenPlugin()])
    var weatherData: WeatherData?
    var tasks: [TaskDetails] = []
    
    init(view: MyTasksViewControllerProtocol) {
        self.view = view
    }
    
    func attach() {
        
    }
    
    func fetchData() {
        provider.request(.todaysTask(long: 0.0, lat: 0.0)) { [weak self] result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let response = try moyaResponse.map(TodaysTasksResponse.self)
                    self?.tasks = response.data?.tasks ?? []
                    self?.weatherData = response.data?.weatherData
                    self?.view?.stopLoadingIndicatorView()
                    self?.view?.updateData()
                } catch {
                    print("Parsing Error")
                }
            case let .failure(error):
                self?.view?.stopLoadingIndicatorView()
            }
        }
    }
    
    func toggleFinish(taskId: String, completion: @escaping () -> ()) {
        provider.request(.toggleFinish(id: taskId)) { [weak self] result in
            switch result {
            case let .success(moyaResponse):
                do {
                    //TODO:- replace this with base response
                    let response = try moyaResponse.map(TodaysTasksResponse.self)
                    self?.view?.stopLoadingIndicatorView()
                    if response.success ?? false {
                        completion()
                    }
                } catch {
                    print("Parsing Error")
                }
            case .failure(let error):
                self?.view?.stopLoadingIndicatorView()
            }
        }
    }
    
}
