//
//  MyFarmPresenter.swift
//  LadyBug
//
//  Created by Sameh on 2/16/21.
//

import Moya

class MyFarmPresenter: MyFarmPresenterProtocol {
    
    weak var view: MyFarmViewProtocol?
    let images = MyFarmImages()
    let localizer = MyFarmLocalizer()
    let farmProvider = MoyaProvider<FarmEndPoint>(plugins: [AuthorizableTokenPlugin()])
    var weatherData: WeatherData?
    var farms: [Farm] = []
    
    init(view: MyFarmViewProtocol) {
        self.view = view
    }
    
    func attach() {
        
    }
    
    func getFarmsDatasourceCount() -> Int {
        return farms.count
    }
    
    func getFarms(for index: Int) -> Farm {
        return farms[index]
    }
    
    func getWeatherData() -> WeatherData? {
        return weatherData
    }
}

extension MyFarmPresenter {
    func fetchUserFarms() {
        farmProvider.request(.userFarms) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(moyaResponse):
                do {
                    let farmResponse = try? moyaResponse.map(UserFarmsResponse.self)
                    self.farms = farmResponse?.data?.farms ?? []
                    self.weatherData = farmResponse?.data?.weatherData
                    self.view?.stopLoadingIndicatorView()
                    self.view?.reloadData()
                } catch {
                    print("Parsing Error")
                    self.view?.stopLoadingIndicatorView()
                }
            case let .failure(error):
                self.view?.stopLoadingIndicatorView()
            }
        }
    }
}
