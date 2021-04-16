//
//  MyTasksHeaderView.swift
//  LadyBug
//
//  Created by SAMEH on 11/03/2021.
//

import UIKit

class MyTasksHeaderView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var sunImageView: UIImageView!
    @IBOutlet weak var tempratureLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var noteTitleContainerView: UIView!
    @IBOutlet weak var noteTitleLabel: UILabel!
    @IBOutlet weak var noteDescriptionLabel: UILabel!
    @IBOutlet weak var taskTitleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibSetup()
    }
        
    private func nibSetup() {
        Bundle.main.loadNibNamed("\(MyTasksHeaderView.self)",
                                 owner: self, options: nil)
        guard let contentView = contentView else { return }
        contentView.frame = self.bounds
        addSubview(contentView)
        setupUI()
    }
}

extension MyTasksHeaderView {
    private func setupUI() {
        setupLabelsFonts()
        setupLabelsColors()
    }
    
    private func setupLabelsFonts() {
        tempratureLabel.font = UIFont.get(enFont: .regular(31), arFont: .regular(31))
        dateLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        timeLabel.font = UIFont.get(enFont: .light(11), arFont: .light(11))
        noteTitleLabel.font = UIFont.get(enFont: .regular(8), arFont: .regular(8))
        noteDescriptionLabel.font = UIFont.get(enFont: .regular(9), arFont: .regular(9))
        taskTitleLabel.font = UIFont.get(enFont: .bold(12), arFont: .bold(12))
    }
    
    private func setupLabelsColors() {
        tempratureLabel.textColor = .purplishBrown
        dateLabel.textColor = .purplishBrown
        timeLabel.textColor = .purplishBrown
        noteDescriptionLabel.textColor = .purplishBrown
        taskTitleLabel.textColor = .purplishBrown
    }
}
