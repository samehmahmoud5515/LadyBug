//
//  StandardSelectionView.swift
//  LadyBug
//
//  Created by SAMEH on 07/03/2021.
//

import UIKit

protocol StandardSelectionViewDelegate: class {
    func didSelectItem(item: String)
}

class StandardSelectionView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectionTextField: UITextField!
    @IBOutlet weak var titleContainerView: UIView!
    @IBOutlet weak var hintButton: UIButton!
    
    fileprivate let pickerView = ToolbarPickerView()
    var datasource = [String]()
    var selectedItem = ""
    weak var delegate: StandardSelectionViewDelegate?
    
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
    func setupUI(title: String? = nil, selectionTitle: String, placeholderColor: UIColor = .blueyGreyTwo) {
        titleLabel.isHidden = title == nil
        titleContainerView.isHidden = title == nil
        titleLabel.text = title
        selectionTextField.text = ""
        setupPlaceholder(placeholder: selectionTitle, color: placeholderColor)
        
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.textColor = .purplishBrown
        
        selectionTextField.font = UIFont.get(enFont: .regular(15), arFont: .regular(15))
        selectionTextField.textColor = .purplishBrown
    }
    
    
    
    func showHintButton() {
        hintButton.isHidden = false
    }
    
    private func setupPickerView() {
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.toolbarDelegate = self
        pickerView.reloadAllComponents()
        selectionTextField.inputView = pickerView
        selectionTextField.inputAccessoryView = pickerView.toolbar
    }
    
    private func setupPlaceholder(placeholder: String, color: UIColor) {
        selectionTextField.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                             attributes: [NSAttributedString.Key.foregroundColor: color])
    }
    
    func requestFocus() {
        selectionTextField.becomeFirstResponder()
    }
    
    func releaseFocus() {
        selectionTextField.resignFirstResponder()
    }
}

extension StandardSelectionView: ToolbarPickerViewDelegate {
    func didTapDone() {
        let row = self.pickerView.selectedRow(inComponent: 0)
        pickerView.selectRow(row, inComponent: 0, animated: false)
        selectionTextField.text = selectedItem
        selectionTextField.resignFirstResponder()
        delegate?.didSelectItem(item: selectedItem)
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
        return datasource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return datasource[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if datasource.count > row {
            selectedItem = datasource[row]
        }
    }
}


