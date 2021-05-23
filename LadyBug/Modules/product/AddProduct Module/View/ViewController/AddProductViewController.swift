//
//  AddProdeuctSuperViewController.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/26/21.
//

import UIKit
import Photos

class AddProductViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addProductButton: UIButton!
    
    private var presnter: AddProductPresenterProtocol!
    init() {
        super.init(nibName: "\(AddProductViewController.self)", bundle: nil)
        presnter = AddProductPresenter(view: self)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presnter.getCitysAndCrops()
        setupUI()
        presnter.attach()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

// MARK:- UI Setup
extension AddProductViewController {
    private func setupUI() {
        setupNaviagtionBarUI()
        addBarButtonsToNavigationBar()
        registerTableViewCell()
        setupTableViewRowHeight()
        setupButtonUI()
        hideKeyboardWhenTappedAround()
        tabelDelegateAndDataSourceSet()
    }
    
    private func setupNaviagtionBarUI() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func addBarButtonsToNavigationBar() {
        navigationItem.leftBarButtonItems = [getLeftButton(), getTitleBarButton()]
        navigationItem.rightBarButtonItem = getRightButton()
    }
    
    private func getLeftButton() -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
        button.setImage(UIImage(named: presnter.images.back), for: .normal)
        button.backgroundColor = .paleGreyThree
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 17
        button.addTarget(self, action: #selector(didTappedBackButton), for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    
    private func getRightButton() -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
        button.setImage(UIImage(named: presnter.images.optional), for: .normal)
        button.backgroundColor = .paleGreyThree
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 17
        return UIBarButtonItem(customView: button)
    }
}
extension AddProductViewController{
    
    private func tabelDelegateAndDataSourceSet(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func getTitleBarButton() -> UIBarButtonItem {
        let titleLabel = UILabel()
        titleLabel.text = presnter.localizer.navigationitleAddProduct
        titleLabel.textColor = .purplishBrown
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.sizeToFit()
        
        return UIBarButtonItem(customView: titleLabel)
    }
    
    private func registerTableViewCell() {
        let AddImage = UINib(nibName: "\(AddImageTableViewCell.self)", bundle: nil)
        tableView.register(AddImage, forCellReuseIdentifier: "\(AddImageTableViewCell.self)")
        
        let Describation = UINib(nibName: "\(AddProductDescriptionCell.self)", bundle: nil)
        tableView.register(Describation, forCellReuseIdentifier: "\(AddProductDescriptionCell.self)")
        
        let Selection = UINib(nibName: "\(AddProductSelectionTableViewCell.self)", bundle: nil)
        tableView.register(Selection, forCellReuseIdentifier: "\(AddProductSelectionTableViewCell.self)")
        
        let TextView = UINib(nibName: "\(AddProductTextViewTableViewCell.self)", bundle: nil)
        tableView.register(TextView, forCellReuseIdentifier: "\(AddProductTextViewTableViewCell.self)")
        
        let priceView = UINib(nibName: "\(AddProductPriceTableViewCell.self)", bundle: nil)
        tableView.register(priceView, forCellReuseIdentifier: "\(AddProductPriceTableViewCell.self)")
        
    }
    
    private func setupTableViewRowHeight() {
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 147
    }
}

extension AddProductViewController: AddProductViewProtocol {
    func stopIndicator() {
        self.startLoadingIndicator()
    }
    
    func getProductsRelations() {
        
    }
    
    func didSelectItem(item: String) {
        
    }
    
    func notifiyDataChange() {
        tableView.reloadData()
    }
}

extension AddProductViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presnter.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        switch presnter.getItemFor(index: indexPath.row) {
            
        case .addImage(_):
            cell = tableView.dequeueReusableCell(withIdentifier: "\(AddImageTableViewCell.self)", for: indexPath)
            cell.selectionStyle = .none
            if let addImage = cell as? AddImageTableViewCell {
                addImage.setupFontUI()
                addImage.delegate = self
                setupTableViewRowHeight()
            }
        case let .productTitle(model):
            cell = tableView.dequeueReusableCell(withIdentifier: "\(AddProductDescriptionCell.self)", for: indexPath)
            if let productTitle = cell as? AddProductDescriptionCell {
                productTitle.setupUI(header: "", title: model.titile)
                setupTableViewRowHeight()
                productTitle.delegate = self
            }
        case let .appropriateCrop(model):
            cell = tableView.dequeueReusableCell(withIdentifier: "\(AddProductSelectionTableViewCell.self)", for: indexPath)
            if let appropriateCrop = cell as? AddProductSelectionTableViewCell {
                appropriateCrop.setupUI(header: model.header, title: presnter.farmedTypes.compactMap{$0.name}.first ?? model.titile )
                appropriateCrop.selectionView.datasource = presnter.farmedTypes.compactMap{$0.name}
                self.tableView.rowHeight = 84
            }
        case let .city(model):
            cell = tableView.dequeueReusableCell(withIdentifier: "\(AddProductSelectionTableViewCell.self)", for: indexPath)
            if let city = cell as? AddProductSelectionTableViewCell {
                city.setupUI(header: model.header, title: presnter.cities.compactMap{$0.name}.first ?? model.titile)
                city.selectionView.datasource = presnter.cities.compactMap{$0.name}
                city.delegate = self
                self.tableView.rowHeight = 84
            }
        case let .region(model):
            cell = tableView.dequeueReusableCell(withIdentifier: "\(AddProductSelectionTableViewCell.self)", for: indexPath)
            if let region = cell as? AddProductSelectionTableViewCell {
                let districts = presnter.selectedCity?.districts?.compactMap { $0.name } ?? []
                region.selectionView.datasource = districts
                region.setupUI(header: model.header, title: districts.first ?? model.titile)
                region.delegate = self
                self.tableView.rowHeight = 84
            }
        case let .otherSites(model):
            cell = tableView.dequeueReusableCell(withIdentifier: "\(AddProductDescriptionCell.self)", for: indexPath)
            if let otherSites = cell as? AddProductDescriptionCell {
                otherSites.setupUI(header: "", title: model.titile)
                self.tableView.rowHeight = 84
                otherSites.delegate = self
            }
        case .description:
            cell = tableView.dequeueReusableCell(withIdentifier: "\(AddProductTextViewTableViewCell.self)", for: indexPath)
            if let description = cell as? AddProductTextViewTableViewCell {
                description.setupUI()
                setupTableViewRowHeight()
                description.delegate = self
            }
        case let .phoneNumber(model):
            cell = tableView.dequeueReusableCell(withIdentifier: "\(AddProductDescriptionCell.self)", for: indexPath)
            if let postCell = cell as? AddProductDescriptionCell {
                postCell.setupUI(header: model.header, title:  model.titile)
                setupTableViewRowHeight()
                postCell.delegate = self
            }
        case let .price(model):
            cell = tableView.dequeueReusableCell(withIdentifier: "\(AddProductPriceTableViewCell.self)", for: indexPath)
            if let price = cell as? AddProductPriceTableViewCell {
                price.setUI(model: model)
                setupTableViewRowHeight()
                price.delegate = self
            }
        }
        return cell
    }
}

extension AddProductViewController{
    func naviageteTo(model: AddProductUIModel) {
        
    }
}
//MARK:- Actions
extension AddProductViewController {
    @objc func didTappedBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
extension AddProductViewController {
    @IBAction func AddProductActionButton(_ sender: UIButton) {
        startLoadingIndicator()
        presnter.createProduct()
    }
    
    private func setupButtonUI() {
        addProductButton.titleLabel?.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        addProductButton.titleLabel?.text = presnter.localizer.addProductButton
    }
}

extension AddProductViewController: TextViewUpdateProtocol {
    func textViewChanged(text: String, _ textView: StandardTextView) {
        presnter.descriptionArLocalized = text
    }
}

extension AddProductViewController: AddProductSelectionTableViewCellSelectionDelegate {
    func didSelectItem(item: String, cell: AddProductSelectionTableViewCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            switch presnter.datasource[indexPath.row] {
            case .city:
                let model = presnter.cities.first(where: { $0.name == item })
                presnter.selectedCity = model
                tableView.reloadRows(at: [IndexPath(row: indexPath.row + 1, section: 0)], with: .none)
            case .region:
                let model = presnter.selectedCity?.districts?.first(where: { $0.name == item})
                presnter.selectedRegion = model
            case .appropriateCrop:
                let model = presnter.farmedTypes.first(where: { $0.name == item})
                presnter.selectedFarmedType = model
                tableView.reloadRows(at: [IndexPath(row: indexPath.row + 0, section: 0)], with: .none)
            default:
                break
            }
        }
    }
}

extension AddProductViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate, AddProductImageProtocol {
    
    
    func addImageButtonDidTapped(_ cell: AddImageTableViewCell) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
        startLoadingIndicator()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? AddImageTableViewCell else { return }
        
        switch cell.isExternalAsset {
        case true:
            if let editedImage = info[.editedImage] as? UIImage {
                cell.addProductMainPictureGulleryImageView.contentMode = .scaleAspectFill
                cell.addProductMainPictureGulleryImageView.image = editedImage
                presnter.selectedExternalAssetUrl = MediaUpload(image: editedImage, fileName: UUID().uuidString)
            } else if let originalImage = info[.originalImage] as? UIImage {
                cell.addProductMainPictureGulleryImageView.contentMode = .scaleAspectFill
                cell.addProductMainPictureGulleryImageView.image = originalImage
                presnter.selectedExternalAssetUrl = MediaUpload(image: originalImage, fileName: UUID().uuidString)
            }
        case false:
            if let editedImage = info[.editedImage] as? UIImage {
                cell.addProductInteriorPictureGulleryImageView.contentMode = .scaleAspectFill
                cell.addProductInteriorPictureGulleryImageView.image = editedImage
                presnter.selectedInternalAssetUrl = MediaUpload(image: editedImage, fileName: UUID().uuidString)
            } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                cell.addProductInteriorPictureGulleryImageView.contentMode = .scaleAspectFill
                cell.addProductInteriorPictureGulleryImageView.image = originalImage
                presnter.selectedInternalAssetUrl = MediaUpload(image: originalImage, fileName: UUID().uuidString)
            }
        }
        
        
        
        stopLoadingIndicator()
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        stopLoadingIndicator()
        picker.dismiss(animated: true, completion: nil)
    }
}

extension AddProductViewController {
    func navigateToProductDetails(product: Product) {
        let vc = ProductDetailsViewController(product: product)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension AddProductViewController: AddProductDescriptionCellDelegate {
    func didChangeText(text: String, cell: AddProductDescriptionCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            switch presnter.datasource[indexPath.row] {
            case .productTitle:
                presnter.nameArLocalized = text
            case .phoneNumber:
                presnter.sellerMobile = text
            case .otherSites:
                presnter.otherLinks = text
            default:
                break
            }
        }
    }
}

extension AddProductViewController: AddProductPriceTableViewCellProtocol {
    func didChangeText(text: String, _ cell: AddProductPriceTableViewCell) {
        presnter.price = text
    }
}

extension AddProductViewController: AddProductTextViewTableViewCellDelegate {
    func textViewChanged(text: String, _ cell: AddProductTextViewTableViewCell) {
        presnter.descriptionArLocalized = text
    }
}
