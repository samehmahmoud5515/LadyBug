//
//  PostDetailsPresenter.swift
//  LadyBug
//
//  Created by SAMEH on 24/03/2021.
//

import Moya

class PostDetailsPresenter: PostDetailsPresenterProtocol {
    var images = PostDetailsImages()
    
    var localizer = PostDetailsLocalizer()
    
    weak var view: PostDetailsViewProtocol?
    
    let provider = MoyaProvider<PostsEndPoint>(plugins: [AuthorizableTokenPlugin()])
    
    var post : UserPost
    
    
    init(view: PostDetailsViewProtocol, post : UserPost) {
        self.view = view
        self.post = post
    }
    
    func attach() {
        
    }
    
    func setLike( postId : Int ,   completion: @escaping () -> () ) {
        provider.request(.toggleLike(id: postId)){ [weak self ] result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let setLikeResponse = try? moyaResponse.map(UserPostBasicResponse.self)
                    if setLikeResponse?.success == true{
                        completion()
                    }
                    print(setLikeResponse?.message)
                } catch {
                    print("Parsing Error")
                }
            case let .failure(error):
                print(error)
                break
            }
        }
    }
    
    func setDisLike( postId : Int , completion: @escaping () -> ()  ) {
        provider.request(.toggleDislike(id: postId)) { [weak self ] result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let setDisLikeResponse = try? moyaResponse.map(UserPostBasicResponse.self)
                    print()
                    if setDisLikeResponse?.success == true{
                        completion()
                    }
                    print(setDisLikeResponse?.message)
                } catch {
                    print("Parsing Error")
                }
            case let .failure(error):
                print(error)
                break
            }
        }
    }
    
    func setCommentLike( commentId : Int ,   completion: @escaping () -> () ) {
        provider.request(.commentsToggleLike(id: commentId)){ [weak self ] result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let setLikeResponse = try? moyaResponse.map(UserPostBasicResponse.self)
                    if setLikeResponse?.success == true{
                        completion()
                    }
                    print(setLikeResponse?.message)
                } catch {
                    print("Parsing Error")
                }
            case let .failure(error):
                print(error)
                break
            }
        }
    }
    
    func setCommentDisLike( commentId : Int , completion: @escaping () -> ()  ) {
        provider.request(.commentsToggleDislike(id: commentId)) { [weak self ] result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let setDisLikeResponse = try? moyaResponse.map(UserPostBasicResponse.self)
                    print()
                    if setDisLikeResponse?.success == true{
                        completion()
                    }
                    print(setDisLikeResponse?.message)
                } catch {
                    print("Parsing Error")
                }
            case let .failure(error):
                print(error)
                break
            }
        }
    }
    
    func solvePost(postId : Int){
        provider.request(.solvePost(postId: postId)){ result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let solvePost = try? moyaResponse.map(UserPostBasicResponse.self)
                    print(solvePost?.message)
                } catch {
                    print("Parsing Error")
                }
            case let .failure(error):
                break
            }
        }
    }
}
