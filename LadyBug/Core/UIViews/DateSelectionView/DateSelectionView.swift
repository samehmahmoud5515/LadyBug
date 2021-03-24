//
//  DateSelectionView.swift
//  LadyBug
//
//  Created by SAMEH on 24/03/2021.
//

import UIKit

class DateSelectionView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var daySelection: StandardSelectionView!
    @IBOutlet weak var monthSelection: StandardSelectionView!
    @IBOutlet weak var yearSelection: StandardSelectionView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibSetup()
    }
        
    private func nibSetup() {
        Bundle.main.loadNibNamed("\(DateSelectionView.self)",
                                 owner: self, options: nil)
        guard let contentView = contentView else { return }
        contentView.frame = bounds
        addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        setupUI()
    }

}

extension DateSelectionView {
    
    private func setupUI() {
        let localizer = CommonLocalizer()
        daySelection.setupUI(selectionTitle: localizer.day, placeholderColor: .purplishBrown)
        monthSelection.setupUI(selectionTitle: localizer.month, placeholderColor: .purplishBrown)
        yearSelection.setupUI(selectionTitle: localizer.year, placeholderColor: .purplishBrown)
    }
    
    func setupTitle(with text: String) {
        titleLabel.text = text
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.textColor = .purplishBrown
    }
}
