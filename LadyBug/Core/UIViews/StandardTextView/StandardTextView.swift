//
//  StandardTextView.swift
//  LadyBug
//
//  Created by SAMEH on 26/03/2021.
//

import UIKit

protocol TextViewUpdateProtocol: class {
    func textViewChanged()
}

class StandardTextView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var placeholderLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    weak var textViewUpdateDelegate: TextViewUpdateProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibSetup()
    }
    
    private func nibSetup() {
        Bundle.main.loadNibNamed("\(StandardTextView.self)",
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

extension StandardTextView {
    private func setupUI() {
        placeholderLabel.font = UIFont.get(enFont: .regular(15), arFont: .regular(15))
        placeholderLabel.textColor = .blueyGreyTwo
        
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.textColor = .purplishBrown
        
        textView.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        textView.textColor = .purplishBrown
        textView.delegate = self
        
        adjustUITextViewHeight()
    }
    
    func adjustUITextViewHeight() {
        textView.sizeToFit()
    }
}

extension StandardTextView: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        adjustUITextViewHeight()
        textViewUpdateDelegate?.textViewChanged()
        placeholderLabel.isHidden = textView.text.count != 0
    }
}

