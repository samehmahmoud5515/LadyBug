//
//  MapPinView.swift
//  PublicTowingApp
//
//  Created by sameh on 9/8/20.
//  Copyright © 2020 Sameh. All rights reserved.
//

import UIKit

class MapPinView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var messageView: UIView!
    @IBOutlet var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibSetup()
    }

    private func nibSetup() {
        Bundle.main.loadNibNamed("\(MapPinView.self)",
                                 owner: self, options: nil)
        guard let contentView = contentView else { return }
        contentView.frame = self.bounds
        addSubview(contentView)
        setupUI()
    }
}

extension MapPinView {
    func hideMessgeView() {
        messageView.isHidden = true
        stackView.alignment = .fill
    }
}

extension MapPinView {
    private func setupUI() {
        messageLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
    }
}
