//
//  FollowersPresenter.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/6/21.
//

import Moya

class FollowersPresenter:FollowersPresenterProtocols{
    
    var localizer = FollowersLocalizer()
    var images =  FollowersImage()
    let provider = MoyaProvider<FollowersEndPoint>(plugins: [AuthorizableTokenPlugin()])
    var user = [User]()
    weak var view : FollowersViewProtocol?
    
    init(view : FollowersViewProtocol ){
        self.view = view
    }
    
    func attach() {
    }
    func getUserFollowers() {
        provider.request(.getUserFollowers) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let getFollowingsResponed = try? moyaResponse.map(FollowingsResponed.self)
                    guard let getFollowers = getFollowingsResponed?.data else { return }
                    self.user = getFollowers.Followers
                    self.view?.reloadData()
                    self.view?.stopIndicator()
                } catch {
                    print("Parsing Error")
                }
            case let .failure(error):
                self.view?.stopIndicator()
                break
            }
        }
    }
    
    func getUserFollowings() {
        provider.request(.getUserFollowings) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let getFollowingsResponed = try? moyaResponse.map(FollowingsResponed.self)
                    guard let getFollowers = getFollowingsResponed?.data else { return }
                    self.user = getFollowers.Followers
                    self.view?.reloadData()
                    self.view?.stopIndicator()
                } catch {
                    print("Parsing Error")
                }
            case let .failure(error):
                self.view?.stopIndicator()
                break
            }
        }
    }
    
    func toggleFollow(userId: Int) {
        provider.request(.toggleFollow(userId: userId)) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let getFollowingsResponed = try? moyaResponse.map(FollowingsResponed.self)
                    guard let getFollowers = getFollowingsResponed?.data else { return }
                    self.user = getFollowers.Followers
                    self.view?.reloadData()
                } catch {
                    print("Parsing Error")
                }
            case let .failure(error):
                break
            }
        }
    }
    
}
