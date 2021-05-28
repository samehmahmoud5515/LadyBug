//
//  PostDetailsSectionHeaderView.swift
//  LadyBug
//
//  Created by SAMEH on 24/03/2021.
//

import UIKit
protocol CommentNumber: class  {
    func setCommentNumber(number : Int)
}

class PostDetailsSectionHeaderView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numberOfCommentsLabel: UILabel!
    @IBOutlet weak var numberOfCommentsValue: UILabel!
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibSetup()
    }
    
    func setCommentNumber(number: Int) {
           numberOfCommentsValue.text = String(number)
       }
        
    private func nibSetup() {
        Bundle.main.loadNibNamed("\(PostDetailsSectionHeaderView.self)",
                                 owner: self, options: nil)
        guard let contentView = contentView else { return }
        contentView.frame = self.bounds
        addSubview(contentView)
        setupUI()
    }
}

extension PostDetailsSectionHeaderView {
    private func setupUI() {
        titleLabel.textColor = .purplishBrown
        numberOfCommentsLabel.textColor = .purplishBrown
        numberOfCommentsValue.textColor = .purplishBrown
        numberOfCommentsValue.textColor = .purplishBrown
        titleLabel.font = UIFont.get(enFont: .bold(12), arFont: .bold(12))
        numberOfCommentsLabel.font = UIFont.get(enFont: .bold(12), arFont: .bold(12))
    }
}


