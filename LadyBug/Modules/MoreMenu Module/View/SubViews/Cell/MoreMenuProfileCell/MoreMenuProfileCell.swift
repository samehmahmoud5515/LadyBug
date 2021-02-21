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
    @IBOutlet weak var profilePointsNumberTitleLAbel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
