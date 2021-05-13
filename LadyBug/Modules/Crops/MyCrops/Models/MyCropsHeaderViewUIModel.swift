//
//  MyCropsHeaderViewUIModel.swift
//  LadyBug
//
//  Created by SAMEH on 02/03/2021.
//

import Foundation

enum MyCropsHeaderViewUIModel {
    case edit
    case crops([MyCropsHeaderViewModel])
}

struct MyCropsHeaderViewModel {
    var image: String = ""
    var isSelected = false
}

extension MyCropsHeaderViewUIModel: Equatable {
    static func == (lhs: MyCropsHeaderViewUIModel, rhs: MyCropsHeaderViewUIModel) -> Bool {
        switch (lhs,rhs) {
        case (.edit, .edit):
            return true
        case (.crops, .crops):
            return true
        default:
            return false
        }
    }
}

extension MyCropsHeaderViewUIModel {
    var numberOfItems: Int {
        switch self {
        case .edit:
            return 1
        case let .crops(models):
            return models.count
        }
    }
}

extension MyCropsHeaderViewUIModel {
    var crops: [MyCropsHeaderViewModel]? {
        switch self {
        case let .crops(models):
            return models
        default:
            return nil
        }
    }
}
