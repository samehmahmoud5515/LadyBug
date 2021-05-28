//
//  MyTasksSectionHeaderView.swift
//  LadyBug
//
//  Created by SAMEH on 11/03/2021.
//

import UIKit

class MyTasksSectionHeaderView: UIView {
        
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibSetup()
    }
        
    private func nibSetup() {
        Bundle.main.loadNibNamed("\(MyTasksSectionHeaderView.self)",
                                 owner: self, options: nil)
        guard let contentView = contentView else { return }
        contentView.frame = self.bounds
        addSubview(contentView)
    }
    
}

extension MyTasksSectionHeaderView {
    func setupUI(title: String) {
        titleLabel.text = title
        titleLabel.textColor = .purplishBrown
        titleLabel.font = UIFont.get(enFont: .bold(16), arFont: .bold(16))
    }
}
