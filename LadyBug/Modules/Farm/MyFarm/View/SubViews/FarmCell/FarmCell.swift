//
//  FarmCell.swift
//  LadyBug
//
//  Created by Sameh on 2/16/21.
//

import UIKit
import SDWebImage

class FarmCell: UITableViewCell {
    
    @IBOutlet weak var farmImageView: UIImageView!
    @IBOutlet weak var farmImageViewContainer: UIView!
    @IBOutlet weak var farmNameLabel: UILabel!
    @IBOutlet weak var farmTypeLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var farmDetailsView: FarmDetailsView!
    @IBOutlet weak var nextMissionTiltleLabel: UILabel!
    @IBOutlet weak var nextMissionDescriptionLabel: UILabel!
    @IBOutlet weak var nextMissionValueLabel: UILabel!
    @IBOutlet weak var nextMissionDateLabel: UILabel!
    @IBOutlet weak var bellButton: UIButton!
    
    func setupUI(farm: Farm) {
        farmNameLabel.text = farm.farmedType?.name
        farmImageView.sd_setImage(with: URL(string: farm.farmedType?.photoURL ?? ""), completed: nil)
        farmTypeLabel.text = farm.farmedType?.farmActivityTypeName
        progressView.isHidden = true
        nextMissionValueLabel.text = farm.comingTask?.name
        nextMissionDescriptionLabel.text = farm.comingTask?.taskTypeName
        nextMissionDateLabel.text = farm.comingTask?.startDate?.toDisplayString
        
        farmNameLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        farmNameLabel.textColor = .purplishBrown
        farmTypeLabel.font = UIFont.get(enFont: .light(9), arFont: .light(9))
        farmTypeLabel.textColor = .blueGrey
        
        nextMissionTiltleLabel.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        farmTypeLabel.textColor = .midGreenTwo
        
        nextMissionDescriptionLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        nextMissionDescriptionLabel.textColor = .purplishBrown
        
        nextMissionValueLabel.font = UIFont.get(enFont: .regular(11), arFont: .regular(11))
        nextMissionValueLabel.textColor = .purplishBrown
        
        nextMissionDateLabel.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        nextMissionDateLabel.textColor = .midGreenTwo
        
        farmDetailsView.datasource = farm.detailsInfo
        //layoutSubviews()
        layoutIfNeeded()
    }
}
