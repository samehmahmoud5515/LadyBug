//
//  CustomSelectionView.swift
//  LadyBug
//
//  Created by SAMEH on 24/03/2021.
//

import UIKit

protocol CustomSelectionViewDelegate: class {
    func selectionDidTapped(_ selection: CustomSelectionView)
}

class CustomSelectionView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var placeholderLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var arrowImageView: UIImageView!
    
    weak var delegate: CustomSelectionViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibSetup()
    }
        
    private func nibSetup() {
        Bundle.main.loadNibNamed("\(CustomSelectionView.self)",
                                 owner: self, options: nil)
        guard let contentView = contentView else { return }
        contentView.frame = bounds
        addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }

}

extension CustomSelectionView {
    func setupUI(title: String, placeholder: String, image: String? = nil, arrowImage: String) {
        titleLabel.text = title
        placeholderLabel.text = placeholder
        if let image = image {
            imageView.image = UIImage(named: image)
            imageView.isHidden = false
        }
        arrowImageView.image = UIImage(named: arrowImage)
        
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.textColor = .purplishBrown
        
        placeholderLabel.font = UIFont.get(enFont: .regular(15), arFont: .regular(15))
        placeholderLabel.textColor = .purplishBrown
    }
    
    func updateSelectionValue(text: String) {
        placeholderLabel.text = text
    }
    
    func addPepoleSetUP(title: String? = nil, selectionTitle: String,  image: String? = nil, arrowImage: String) {
        titleLabel.isHidden = title == nil
        contentView.isHidden = title == nil
        titleLabel.text = title
        placeholderLabel.text = selectionTitle
        
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.textColor = .purplishBrown
        
        arrowImageView.image = UIImage(named: arrowImage)
        
        placeholderLabel.font = UIFont.get(enFont: .regular(15), arFont: .regular(15))
        placeholderLabel.textColor = .blueyGreyTwo
    }
}

// MARK: - Action
extension CustomSelectionView {
    @IBAction func viewDidTapped(_ sender: Any) {
        delegate?.selectionDidTapped(self)
    }
}
