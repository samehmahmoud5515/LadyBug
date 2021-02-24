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
    case Description(AddPostDescription)
}

struct AddPostModel {
    var title = ""
    var selectionTitle = ""
}

struct AddPostDescription {
    var title:String = ""
    var text:String = ""
}


