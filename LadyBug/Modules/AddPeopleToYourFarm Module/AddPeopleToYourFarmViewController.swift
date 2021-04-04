//
//  AddPeopleToYourFarmViewController.swift
//  LadyBug
//
//  Created by SAMEH on 07/03/2021.
//

import UIKit

class AddPeopleToYourFarmViewController: UIViewController {
    
    @IBOutlet weak var personSelectionView: CustomSelectionView!
    @IBOutlet weak var privilegeSelectionView: CustomSelectionView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dismissView: UIView!
        
    var localizer = AddPeopleToYourFarmLocalizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addGestureToView()
    }
    
    func didSelectItem(item: String) {
       }
       
    func target() {
        let Vc = FarmPersonSelectionViewController()
           self.navigationController?.pushViewController(Vc, animated: true)
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
        personSelectionView.addPepoleSetUP(title: localizer.selectPeopleTitle, selectionTitle: localizer.selectionPeopleTitle, arrowImage: "common_arrow_left_ic")
        privilegeSelectionView.addPepoleSetUP(title: localizer.previlageTitle, selectionTitle: localizer.previlageSelectionTitle, arrowImage: "common_arrow_left_ic")
        personSelectionView.delegate = self
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
extension AddPeopleToYourFarmViewController : CustomSelectionViewDelegate {
    func selectionDidTapped(_ selection: CustomSelectionView) {
        let vc = FarmPersonSelectionViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)    }
}
