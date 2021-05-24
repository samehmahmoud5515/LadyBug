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
    @IBOutlet weak var addProductMainPictureGulleryImageView: UIImageView!
    @IBOutlet weak var addProductMainPicturetitle: UILabel!
    @IBOutlet weak var addProductInteriorPictureViewTitle: UILabel!
    @IBOutlet weak var addProductInteriorPictureView: UIView!
    @IBOutlet weak var addProductInteriorPictureImageView: UIImageView!
    @IBOutlet weak var addProductInteriorPictureGulleryImageView: UIImageView!
    @IBOutlet weak var addProductInteriorPicturetitle: UILabel!
    @IBOutlet weak var addProductMainPictureImageButton: UIButton!
    @IBOutlet weak var addProductInteriorPictureButton: UIButton!
    var isExternalAsset: Bool = true
    weak var delegate : AddProductImageProtocol?
    
    func setupFontUI() {
        addProductMainPictureViewTitle.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        addProductMainPicturetitle.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
        addProductInteriorPictureViewTitle.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        addProductInteriorPicturetitle.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
     }
    
    @IBAction func addProductMainPictureImageActionButton(_ sender: UIButton) {
        delegate?.addImageButtonDidTapped(self)
        isExternalAsset = true
    }
    
    @IBAction func addProductInteriorPictureActionButton(_ sender: UIButton) {
        delegate?.addImageButtonDidTapped(self)
        isExternalAsset = false
    }
    
}

