//
//  DynamicHeightTableView.swift
//  LadyBug
//
//  Created by SAMEH on 07/03/2021.
//

import UIKit

class DynamicHeightTableView: UITableView {
    
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return self.contentSize
    }

    override var contentSize: CGSize {
        didSet{
            self.invalidateIntrinsicContentSize()
        }
    }

    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }
}
