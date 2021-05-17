//
//  MyFarmDetailsCell.swift
//  LadyBug
//
//  Created by SAMEH on 05/03/2021.
//

import UIKit

class MyFarmDetailsCell: UITableViewCell {
    
    @IBOutlet weak var detailsView: MyFarmDetailsView!
    
    var datasource = [FarmUIModel]() {
        didSet {
            detailsView.datasource = datasource
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        datasource = []
    }
}
