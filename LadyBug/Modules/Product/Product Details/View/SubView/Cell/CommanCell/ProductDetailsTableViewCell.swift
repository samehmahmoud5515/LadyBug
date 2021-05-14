//
//  ProductDetailsTableViewCell.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/20/21.
//

import UIKit

class ProductDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var labeTitle: UILabel!
    @IBOutlet weak var labelContentTitle: UILabel!
    
      func setupFontUI() {
        
              labeTitle.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
             labelContentTitle.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
    }
    func setupUI(model: ProductInfo) {
           labeTitle.text = model.title
        labelContentTitle.text = model.Content
           setupFontUI()
       }
}
