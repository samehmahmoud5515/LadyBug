//
//  AddPeopleToYourFarmViewController.swift
//  LadyBug
//
//  Created by SAMEH on 07/03/2021.
//

import UIKit

class AddPeopleToYourFarmViewController: UIViewController {

    @IBOutlet weak var personSelectionView: StandardSelectionView!
    @IBOutlet weak var privilegeSelectionView: StandardSelectionView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dismissView: UIView!
        
    var localizer = AddPeopleToYourFarmLocalizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addGestureToView()
    }

}

extension AddPeopleToYourFarmViewController {
    private func setupUI() {
        setupLabels()
        setupSelectionViews()
    }
    
    private func setupLabels() {
        titleLabel.textColor = .purplishBrown
        titleLabel.font = UIFont.get(enFont: .bold(16), arFont: .bold(16))
        addButton.titleLabel?.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
    }
    
    private func setupSelectionViews() {
        personSelectionView.setupUI(title: localizer.selectPeopleTitle, selectionTitle: localizer.selectionPeopleTitle)
        privilegeSelectionView.setupUI(title: localizer.previlageTitle, selectionTitle: localizer.previlageSelectionTitle)
    }
    
    
}

extension AddPeopleToYourFarmViewController {
    private func addGestureToView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        dismissView.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        dismiss(animated: false, completion: nil)
    }

}
