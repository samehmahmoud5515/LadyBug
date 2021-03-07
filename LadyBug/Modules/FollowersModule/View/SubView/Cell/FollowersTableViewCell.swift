//
//  FollowersTableViewCell.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/6/21.
//

import UIKit

class FollowersTableViewCell: UITableViewCell {
    @IBOutlet weak var followersProfileImage: UIImageView!
    @IBOutlet weak var followersProfileNameLabel: UILabel!
    @IBOutlet weak var followersOccupationLabel: UILabel!
    @IBOutlet weak var followersEmailLabel: UILabel!
    @IBOutlet weak var followersFollowingButton: UIButton!
    

    func setupUI(){
        
        followersProfileNameLabel.font = UIFont.get(enFont: .regular(13), arFont: .regular(13))
        
        followersOccupationLabel.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        
      followersEmailLabel.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        
      followersFollowingButton.titleLabel?.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
      
    }
   
    
}
