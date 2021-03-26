//
//  AddTaskViewController.swift
//  LadyBug
//
//  Created by SAMEH on 26/03/2021.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var scrollViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var taskNameField: StandardTextFieldView!
    @IBOutlet weak var taskTypeField: StandardSelectionView!
    @IBOutlet weak var quantityField: StandardTextFieldView!
    @IBOutlet weak var taskDateField: CustomSelectionView!
    @IBOutlet weak var alertDateField: StandardSelectionView!
    @IBOutlet weak var addTaskButton: UIButton!
    @IBOutlet weak var dismissView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        observeOnCollectionViewContentSize()
        hideKeyboardWhenTappedAround()
        addGestureToView()
    }
    
    private func observeOnCollectionViewContentSize() {
        scrollView.addObserver(self, forKeyPath: "contentSize", options: [.new, .old, .initial, .prior], context: nil)
    }
    
    override func observeValue(forKeyPath _: String?, of _: Any?, change _: [NSKeyValueChangeKey: Any]?, context _: UnsafeMutableRawPointer?) {
        guard scrollView.contentSize.height > 0 else { return }
        let diff = self.view.bounds.height - scrollView.contentSize.height
        if diff < 100 {
            self.scrollViewTopConstraint.constant = max(diff, 50)
            self.view.layoutIfNeeded()
        }
    }

}

extension AddTaskViewController {
    private func setupUI() {
        titleLabel.textColor = .purplishBrown
        titleLabel.font = UIFont.get(enFont: .bold(16), arFont: .bold(16))
        
        taskNameField.setupUI(isPasswordField: false, placeholder: "المهمة", nextButton: true)
        taskNameField.setupFloatingTitle(with: "اكتب المهمة الخاصة بك")
        taskNameField.setupSpacing(insets: .zero)
        
        taskTypeField.setupUI(title: "نوع المهمة", selectionTitle: "زراعة", placeholderColor: .purplishBrown)
        
        quantityField.setupSpacing(insets: .zero)
        quantityField.setupFloatingTitle(with: "الكمية")
        quantityField.setupUI(isPasswordField: false, placeholder: "اكتب الكمية", nextButton: true)
        
        taskDateField.setupUI(title: "الميعاد", placeholder: "اختر ميعاد المهمة", image: nil, arrowImage: "common_arrow_left_ic")
        
        alertDateField.setupUI(title: "ميعاد التنبية", selectionTitle: "اختر ميعاد التنبية")
        
        addTaskButton.titleLabel?.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
    }
}

extension AddTaskViewController {
    private func addGestureToView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        dismissView.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        dismiss(animated: false, completion: nil)
    }
}
