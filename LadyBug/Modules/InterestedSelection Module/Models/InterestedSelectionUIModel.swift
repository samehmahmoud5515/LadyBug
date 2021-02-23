//
//  InterestedSelectionUIModel.swift
//  LadyBug
//
//  Created by SAMEH on 22/02/2021.
//

import Foundation

struct InterestedSelectionUIModel {
    let title: String
    var data : [CropUIModel]

    var numberOfItems: Int {
        return data.count
    }

    subscript(index: Int) -> CropUIModel {
        return data[index]
    }
}

extension InterestedSelectionUIModel {
    //  Putting a new init method here means we can
    //  keep the original, memberwise initaliser.
    init(title: String, data: CropUIModel...) {
        self.title = title
        self.data  = data
    }
}

struct CropUIModel {
    var isSelected = false
    
    mutating func toggleSelection() {
        isSelected = !isSelected
    }
}
