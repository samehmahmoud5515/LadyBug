//
//  PostsModel.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 5/22/21.
//


import Foundation

// MARK: - UserPostBasicResponse
struct UserPostBasicResponse: Codable {
    var success: Bool?
    var data: DataClass?
    var message: String?
    var code: Int?
}

// MARK: - DataClass
struct DataClass: Codable {
}

// MARK: - UserPostsResponse
struct UserPostsResponse: Codable {
    var success: Bool
    var data: Posts
    var message: String
    var code: Int
}

// MARK: - DataClass
struct Posts: Codable {
    var all: [UserPost]
}

struct UserPost: Codable {
    var id: Int?
    var content: String?
    var author: User?
    var farm: String?
    var farmedTypePhoto: String?
    var farmedTypeID: Int?
    var solved: Bool?
    var imageAssets: [String]?
    var videoAssets: [String]?
    var likersCount, dislikersCount, commentsCount: Int?
    var likers, dislikers: [User]?
    var likedByMe, dislikedByMe: Bool?
    var comments: [PostComment]?
    var createdAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id, content , author , farm
        case farmedTypePhoto = "farmed_type_photo"
        case farmedTypeID = "farmed_type_id"
        case solved
        case imageAssets = "image_assets"
        case videoAssets = "video_assets"
        case likersCount = "likers_count"
        case dislikersCount = "dislikers_count"
        case commentsCount = "comments_count"
        case likers, dislikers
        case likedByMe = "liked_by_me"
        case dislikedByMe = "disliked_by_me"
        case comments
        case createdAt = "created_at"
    }
}

//MARK:-

struct PostComment: Codable {
    var id: Int?
    var content: String?
    var commenter: Commenter?
    var postID: Int?
    var assets: [String]?
    var repliesCount, likersCount, dislikersCount: Int?
    var likers, dislikers: [User]?
    var likedByMe, dislikedByMe: Bool?
    var replies: [String]?
    var createdAt: String?

    enum CodingKeys: String, CodingKey {
        case id, content, commenter
        case postID = "post_id"
        case assets
        case repliesCount = "replies_count"
        case likersCount = "likers_count"
        case dislikersCount = "dislikers_count"
        case likers, dislikers
        case likedByMe = "liked_by_me"
        case dislikedByMe = "disliked_by_me"
        case replies
        case createdAt = "created_at"
    }
}


