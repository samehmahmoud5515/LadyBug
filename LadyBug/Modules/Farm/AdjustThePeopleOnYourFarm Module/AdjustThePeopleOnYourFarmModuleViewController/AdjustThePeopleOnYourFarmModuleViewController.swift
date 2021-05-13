//
//  AdjustThePeopleOnYourFarmModuleViewController.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 4/10/21.
//

import UIKit

class AdjustThePeopleOnYourFarmModuleViewController: UIViewController {
    
    @IBOutlet weak var viewHeadTitle: UILabel!
    @IBOutlet weak var selectPresonTitle: UILabel!
    @IBOutlet weak var personNameTitle: UILabel!
    @IBOutlet weak var emailTitle: UILabel!
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var arrowSelectPersonImageView: UIImageView!
    @IBOutlet weak var permissionsView: CustomSelectionView!
    @IBOutlet weak var editButtonTitle: UIButton!
    @IBOutlet weak var deletePesonButtonTitle: UIButton!
    @IBOutlet weak var dismissView: UIView!
    
    var localizer = AdjustThePeopleOnYourFarmLocalizer()
    var image = AdjustThePeopleOnYourFarmImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addGestureToView()
    }
}

extension AdjustThePeopleOnYourFarmModuleViewController{
    private func setupUI() {
        setupLabels()
        setupSelectionViews()
    }
    
    private func setupLabels() {
        viewHeadTitle.textColor = .purplishBrown
        viewHeadTitle.font = UIFont.get(enFont: .bold(16), arFont: .bold(16))
        selectPresonTitle.textColor = .purplishBrown
        selectPresonTitle.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        personNameTitle.textColor = .purplishBrown
        personNameTitle.font = UIFont.get(enFont: .regular(13), arFont: .regular(13))
        emailTitle.textColor = .blueGrey
        emailTitle.font = UIFont.get(enFont: .regular(11), arFont: .regular(11))
        editButtonTitle.titleLabel?.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        deletePesonButtonTitle.titleLabel?.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
    }
    
    private func setupSelectionViews() {
        permissionsView.setupUI(title: localizer.permissionsTitle, placeholder: localizer.editTitle, arrowImage: "common_arrow_left_ic")
    }
}

extension AdjustThePeopleOnYourFarmModuleViewController{
    @IBAction func editePersonActionButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deletePersonButton(_ sender: UIButton) {
    }
}

extension AdjustThePeopleOnYourFarmModuleViewController{
    
    private func addGestureToView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        dismissView.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        dismiss(animated: false, completion: nil)
    }
    
}


