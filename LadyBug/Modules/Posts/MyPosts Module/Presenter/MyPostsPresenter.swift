//
//  VideosPresenter.swift
//  LadyBug
//
//  Created by Sameh on 2/20/21.
//

import Moya

class MyPostsPresenter: MyPostsPresenterProtocol {
    
    var numberOfSectionsInHeader: Int = 2
    var postsDatasource: [String] = ["1","1","1","1","1","1"]
    weak var view: MyPostsViewProtocol?
    let myPostsProvider = MoyaProvider<PostsEndPoint>(plugins: [AuthorizableTokenPlugin()])
    var myPosts = [UserPost]()
    var images = MyPostsImages()
    var localizer = MyPostsLocalizer()
    
    init(view: MyPostsViewProtocol) {
        self.view = view
    }
    
    func attach() {
        
    }
    
    func setupCellUI(_ cell: MyPostsCellProtocol, index: Int) {
        cell.setupUI(localizer: localizer, postData: myPosts[index])
    }
    
    func didTappedCell(with index: Int) {
        
    }
    
    func getUserPosts() {
        myPostsProvider.request(.getUserPosts) { [weak self ] result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let userPostsResponse = try? moyaResponse.map(UserPostsResponse.self)
                    guard let posts = userPostsResponse?.data.all  else { return }
                    self?.myPosts = posts
                    self?.view?.reloadData()
                    self?.view?.stopIndicator()
                } catch {
                    print("Parsing Error")
                    self?.view?.stopIndicator()
                }
            case let .failure(error):
                print(error)
                self?.view?.stopIndicator()
                break
            }
        }
    }
}
