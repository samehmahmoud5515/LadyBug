//
//  FarmPersonSelectionTableViewCell.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/6/21.
//

import UIKit

class FarmPersonSelectionTableViewCell: UITableViewCell {
    @IBOutlet weak var FarmPersonSelectionProfileImage: UIImageView!
    @IBOutlet weak var FarmPersonSelectionProfileNameLabel: UILabel!
    @IBOutlet weak var FarmPersonSelectionOccupationLabel: UILabel!
    @IBOutlet weak var FarmPersonSelectionEmailLabel: UILabel!
    @IBOutlet weak var FarmPersonSelectionFollowingButton: UIButton!
    

    func setupUI(){
        
        FarmPersonSelectionProfileNameLabel.font = UIFont.get(enFont: .regular(13), arFont: .regular(13))
        
        FarmPersonSelectionOccupationLabel.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        
      FarmPersonSelectionEmailLabel.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        
       FarmPersonSelectionFollowingButton.titleLabel?.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
      
    }
   
    
}
