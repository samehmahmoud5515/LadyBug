//
//  WeatherProtocol.swift
//  LadyBug
//
//  Created by SAMEH on 11/03/2021.
//

import Foundation

protocol MyTasksPresenterProtocol {
    var images: MyTasksImages { get }
    var localizer: MyTasksLocalizer { get }
    var weatherData: WeatherData? { get }
    var tasks: [TaskDetails] { get set }
    func attach()
    func fetchData()
    func toggleFinish(taskId: String, completion: @escaping () -> ())
}

protocol MyTasksViewControllerProtocol: class {
    func startLoadingIndicatorView()
    func stopLoadingIndicatorView()
    func updateData()
}
