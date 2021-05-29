//
//  MoreMenuCell.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 2/20/21.
//

import UIKit

class MoreMenuProfileCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileUserNameLabel: UILabel!
    @IBOutlet weak var profileNumberLabel: UILabel!
    @IBOutlet weak var pofileOccupationLabel: UILabel!
    @IBOutlet weak var profilePointsImageView: UIImageView!
    @IBOutlet weak var profilePointsLabel: UILabel!
    @IBOutlet weak var profileEditeLabel: UILabel!
    @IBOutlet weak var profileArrowImageView: UIImageView!
    @IBOutlet weak var profilePointNumberLabel: UILabel!
    @IBOutlet weak var profilePointlabel: UILabel!
    
    
    func setupUI(model: MoreMenuProfileModel, data : User?) {
        setupFonts()
        profileImageView.sd_setImage(with: URL(string: data?.photoURL ?? ""))
        
        profileImageView.image = UIImage(named: model.profileImage)
        
        pofileOccupationLabel.text = data?.jobName
        
        profileUserNameLabel.text = data?.name
        
        profileNumberLabel.text = data?.mobile
        
        profilePointsImageView.image = UIImage(named: model.numberOfPointsImage)
        
        profilePointsLabel.text = model.numberOfPointsTitle
        
        profileEditeLabel.text = model.editTitle
        guard let activityPoints = data?.activityPoints  else { return }
        profilePointNumberLabel.text = String(activityPoints)
    }
    
    private func setupFonts(){
        profileUserNameLabel.font = UIFont.get(enFont: .regular(14), arFont: .regular(14))
        profileNumberLabel.font = UIFont.get(enFont: .regular(14), arFont: .regular(14))
        pofileOccupationLabel.font = UIFont.get(enFont: .regular(14), arFont: .regular(14))
        profilePointsLabel.font = UIFont.get(enFont: .regular(14), arFont: .regular(14))
        profileEditeLabel.font = UIFont.get(enFont: .regular(14), arFont: .regular(14))
        profilePointNumberLabel.font = UIFont.get(enFont: .regular(14), arFont: .regular(14))
        profilePointlabel.font = UIFont.get(enFont: .regular(14), arFont: .regular(14))
    }
    
}
