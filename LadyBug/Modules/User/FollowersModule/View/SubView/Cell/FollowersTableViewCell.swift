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
    
    
    func setupUI(user : User){
        
        setIamge(userImage: user.photoURL)
        followersProfileNameLabel.text = user.name
        followersOccupationLabel.text = user.jobName
        followersEmailLabel.text = user.email
        setupFont()
    }
    
}
extension FollowersTableViewCell{
    private func setupFont(){
        followersProfileNameLabel.font = UIFont.get(enFont: .regular(13), arFont: .regular(13))
        followersOccupationLabel.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        followersEmailLabel.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        followersFollowingButton.titleLabel?.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        }
    
    private func getImage(from string: String) -> UIImage? {
        //2. Get valid URL
        guard let url = URL(string: string)
            else {
                print("Unable to create URL")
                return nil
        }
        var image: UIImage? = nil
        do {
            //3. Get valid data
            let data = try Data(contentsOf: url, options: [])
            //4. Make image
            image = UIImage(data: data)
        }
        catch {
            print(error.localizedDescription)
        }
        return image
    }

    private func setIamge(userImage : String? ){
        
        guard let image = userImage else {return}
        if let image = getImage(from: image) {
            followersProfileImage.image = image
        }
    }
}

