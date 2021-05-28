//
//  PostEndPoint.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 5/22/21.
//

import Moya

enum PostsEndPoint {
    case getUserPosts
    case toggleDislike(id: Int )
    case toggleLike(id: Int)
    case toggleCommentLike(id: Int)
    case toggleCommentDislike(id: Int)
    case solvePost(postId : Int)
    case editComment(postId : Int)
    case createComment
}

extension PostsEndPoint: TargetType, AccessTokenAuthorizable, CommonHeaderProtocol {
    
    var baseURL: URL {
        Environment.baseUrl
    }
    
    var path: String {
        
        switch self {
        case .getUserPosts:
            return "/api/v1/users/posts/index"
        case let .toggleDislike(id: postId):
            return "/api/v1/posts/toggle_dislike/" + String(postId)
        case let .toggleLike(id: postId ) :
            return "/api/v1/posts/toggle_like/" + String(postId)
        case let .toggleCommentLike(id: postId):
            return "/api/v1/comments/toggle_like/" + String(postId)
        case let .toggleCommentDislike(id: postId ) :
            return "/api/v1/comments/toggle_dislike/" + String(postId)
        case let .solvePost(postId):
            return "/api/v1/posts/toggle_solve/" + String(postId)
        case let .editComment(postId ) :
            return "/api/v1/comments/" + String(postId)
        case .createComment :
            return "/api/v1/comments"
        }
    }
    
    var method: Method {
        switch self {
        case .getUserPosts , .toggleDislike , .toggleLike , .toggleCommentDislike , .toggleCommentLike, .solvePost :
            return .get
        case .editComment , .createComment :
            return .post
        }
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
        case .getUserPosts, .toggleDislike, .toggleLike, .toggleCommentDislike, .toggleCommentLike, .solvePost, .editComment , .createComment :
            return .requestPlain
            
        }
    }
    var headers: [String : String]? {
        
        return commonHeader
    }
    
    var authorizationType: AuthorizationType {
        .bearer
    }
}
