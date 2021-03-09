//
//  StandardSelectionView.swift
//  LadyBug
//
//  Created by SAMEH on 07/03/2021.
//

import UIKit

class StandardSelectionView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectionTextField: UITextField!
    
    fileprivate let pickerView = ToolbarPickerView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibSetup()
    }
        
    private func nibSetup() {
        Bundle.main.loadNibNamed("\(StandardSelectionView.self)",
                                 owner: self, options: nil)
        guard let contentView = contentView else { return }
        contentView.frame = bounds
        addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        setupPickerView()
    }
    
}

extension StandardSelectionView {
    func setupUI(title: String, selectionTitle: String) {
        titleLabel.text = title
        selectionTextField.text = ""
        setupPlaceholder(placeholder: selectionTitle)
        
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.textColor = .purplishBrown
        
        selectionTextField.font = UIFont.get(enFont: .regular(15), arFont: .regular(15))
        selectionTextField.textColor = .blueyGreyTwo
    }
    
    private func setupPickerView() {
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.toolbarDelegate = self
        pickerView.reloadAllComponents()
        selectionTextField.inputView = pickerView
        selectionTextField.inputAccessoryView = pickerView.toolbar
    }
    
    private func setupPlaceholder(placeholder: String) {
        selectionTextField.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.blueyGreyTwo])
    }
}

extension StandardSelectionView: ToolbarPickerViewDelegate {
    func didTapDone() {
        let row = self.pickerView.selectedRow(inComponent: 0)
        pickerView.selectRow(row, inComponent: 0, animated: false)
        selectionTextField.text = "more_menu_profile_user_name_title".localized
        selectionTextField.resignFirstResponder()
    }
    
    func didTapCancel() {
        selectionTextField.resignFirstResponder()
        selectionTextField.text = nil
    }
}

extension StandardSelectionView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "more_menu_profile_user_name_title".localized
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
}
