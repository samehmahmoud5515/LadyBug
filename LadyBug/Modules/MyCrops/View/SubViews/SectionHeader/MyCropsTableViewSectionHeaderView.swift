//
//  MyCropsTableViewSectionHeaderView.swift
//  LadyBug
//
//  Created by SAMEH on 02/03/2021.
//

import UIKit

class MyCropsTableViewSectionHeaderView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibSetup()
    }
        
    private func nibSetup() {
        Bundle.main.loadNibNamed("\(MyCropsTableViewSectionHeaderView.self)",
                                 owner: self, options: nil)
        guard let contentView = contentView else { return }
        contentView.frame = self.bounds
        addSubview(contentView)
        setupUI()
    }
}

extension MyCropsTableViewSectionHeaderView {
    func setupUI() {
        titleLabel.textColor = .purplishBrown
        moreButton.titleLabel?.textColor = .midGreenTwo
        
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        moreButton.titleLabel?.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
    }
}
