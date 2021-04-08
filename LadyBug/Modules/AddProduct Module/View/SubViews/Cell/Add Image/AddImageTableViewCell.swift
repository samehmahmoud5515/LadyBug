//
//  AddImageTableViewCell.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 4/2/21.
//

import UIKit

class AddImageTableViewCell: UITableViewCell {

    @IBOutlet weak var addProductMainPictureViewTitle: UILabel!
    @IBOutlet weak var addProductMainPictureView: UIView!
    @IBOutlet weak var addProductMainPictureImageView: UIImageView!
    @IBOutlet weak var addProductMainPicturetitle: UILabel!
    @IBOutlet weak var addProductInteriorPictureViewTitle: UILabel!
    @IBOutlet weak var addProductInteriorPictureView: UIView!
    @IBOutlet weak var addProductInteriorPictureImageView: UIImageView!
    @IBOutlet weak var addProductInteriorPicturetitle: UILabel!
    
    func setupFontUI() {
        addProductMainPictureViewTitle.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        addProductMainPicturetitle.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        addProductInteriorPictureViewTitle.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        addProductInteriorPicturetitle.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
     }
}
