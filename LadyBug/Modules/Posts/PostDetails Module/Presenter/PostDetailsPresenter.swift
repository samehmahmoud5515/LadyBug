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
    
    var commentImage: MediaUpload?
    
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
                    let setLikeResponse = try? moyaResponse.map(BaseResponse.self)
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
                    let setDisLikeResponse = try? moyaResponse.map(BaseResponse.self)
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
        provider.request(.toggleCommentLike(id: commentId)){ [weak self ] result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let setLikeResponse = try? moyaResponse.map(BaseResponse.self)
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
        provider.request(.toggleCommentDislike(id: commentId)) { [weak self ] result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let setDisLikeResponse = try? moyaResponse.map(BaseResponse.self)
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
                    let solvePost = try? moyaResponse.map(BaseResponse.self)
                    print(solvePost?.message)
                } catch {
                    print("Parsing Error")
                }
            case let .failure(error):
                break
            }
        }
    }

    func createComment(content: String, postId: Int) {
      provider.request(.createComment(content: content, postId: postId, photo: commentImage )) { result in
                 switch result {
                 case let .success(moyaResponse):
                     do {
                         let addcCommentResponse = try? moyaResponse.map(AddComment.self)
                         print(addcCommentResponse?.message as Any)
                     } catch {
                         print("Parsing Error")
                     }
                 case let .failure(error):
                     print(error)
                     break
                 }
             }
    }
}
