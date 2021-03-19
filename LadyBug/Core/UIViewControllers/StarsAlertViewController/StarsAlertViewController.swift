//
//  StarsAlertViewController.swift
//  LadyBug
//
//  Created by SAMEH on 19/03/2021.
//

import UIKit
import Cosmos

protocol StarsAlertViewControllerDelegate: class {
    func confirmButtonDidTapped(for alert: StarsAlertViewController, with rate: Double)
    func cancelButtonDidTapped(for alert: StarsAlertViewController)
}

class StarsAlertViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var starsView: CosmosView!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    private var alertTitle: String?
    private var alertMessage: String?
    weak var delegate: StarsAlertViewControllerDelegate?
    
    init(title: String?, message: String?, delegate: StarsAlertViewControllerDelegate) {
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
        delegate?.confirmButtonDidTapped(for: self, with: starsView.rating)
    }
    
    @IBAction func cancelButtonDidTapped(_ sender: Any) {
        delegate?.cancelButtonDidTapped(for: self)
    }

}

extension StarsAlertViewController {
    private func setupUI() {
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.textColor = .purplishBrown
        titleLabel.text = alertTitle
        
        confirmButton.titleLabel?.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        confirmButton.setTitleColor(.midGreenTwo, for: .normal)
        
        cancelButton.titleLabel?.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        cancelButton.setTitleColor(.tomatoRed, for: .normal)
    }
}