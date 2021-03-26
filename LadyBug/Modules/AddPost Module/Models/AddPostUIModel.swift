//
//  AddPostUIModel.swift
//  LadyBug
//
//  Created by SAMEH on 21/02/2021.
//

import Foundation

enum AddPostUIModel {
    case postType(AddPostModel)
    case cropType(AddPostModel)
    case description(AddPostModel)
    case image(AddPostModel)
}

struct AddPostModel {
    var title = ""
    var selectionTitle = ""
}
