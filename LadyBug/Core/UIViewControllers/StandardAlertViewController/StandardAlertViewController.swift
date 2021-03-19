//
//  StandardAlertViewController.swift
//  LadyBug
//
//  Created by SAMEH on 19/03/2021.
//

import UIKit

protocol StandardAlertViewControllerDelegate: class {
    func confirmButtonDidTapped(for alert: StandardAlertViewController)
    func cancelButtonDidTapped(for alert: StandardAlertViewController)
}

class StandardAlertViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    private var alertTitle: String?
    private var alertMessage: String?
    weak var delegate: StandardAlertViewControllerDelegate?
    
    init(title: String?, message: String?, delegate: StandardAlertViewControllerDelegate) {
        super.init(nibName: "\(StandardAlertViewController.self)", bundle: nil)
        self.alertTitle = title
        self.alertMessage = message
        self.delegate = delegate
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func confirmButtonDidTapped(_ sender: Any) {
        delegate?.confirmButtonDidTapped(for: self)
    }
    
    @IBAction func cancelButtonDidTapped(_ sender: Any) {
        delegate?.cancelButtonDidTapped(for: self)
    }
    
}

extension StandardAlertViewController {
    private func setupUI() {
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.textColor = .purplishBrown
        titleLabel.text = alertTitle
        messageLabel.text = alertMessage
        
        messageLabel.font = UIFont.get(enFont: .regular(14), arFont: .regular(14))
        messageLabel.textColor = .purplishBrown
        
        confirmButton.titleLabel?.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        confirmButton.setTitleColor(.midGreenTwo, for: .normal)
        
        cancelButton.titleLabel?.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        cancelButton.setTitleColor(.tomatoRed, for: .normal)
    }
}
