//
//  ProductDetailsViewController.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/18/21.
//

import UIKit
import SDWebImage

class ProductDetailsViewController: UIViewController{
    
    @IBOutlet weak var productDetailsHeadImage: UIImageView!
    @IBOutlet weak var productDetailsCropsLabel: UILabel!
    @IBOutlet weak var productDetailsCropsTitle: UILabel!
    @IBOutlet weak var productDetailsSupplierLabel: UILabel!
    @IBOutlet weak var productDetailsCityLabel: UILabel!
    @IBOutlet weak var productDetailsCurrencyLabel: UILabel!
    @IBOutlet weak var productDetailsPriceLabel: UILabel!
    @IBOutlet weak var productDetailsDescrptionProductLabel: UILabel!
    @IBOutlet weak var productDetailsDescrptionProductContentLabel:UILabel!
    @IBOutlet weak var productDetailsAdviceLabel: UILabel!
    @IBOutlet weak var productDetailsContentAdviceFirstLabel: UILabel!
    @IBOutlet weak var productDetailsContentAdviceSecondLabel: UILabel!
    @IBOutlet weak var productDetailsContentAdviceThirdLabel: UILabel!
    @IBOutlet weak var productDetailsButtonLabelTile: UILabel!
    @IBOutlet weak var productDetailsButtonNumberLabelTitle: UILabel!
    @IBOutlet weak var productDetailsButton: UIButton!
    @IBOutlet weak var tableView: DynamicHeightTableView!
    
    private var presnter: ProductDetailsPresenterProtocols!
    
    
    init(product: Product){
        super.init(nibName: "\(ProductDetailsViewController.self)", bundle: nil)
        presnter = ProductDetailsPresenter(view : self, product: product)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startLoadingIndicator()
        setupUI()
        setFont()
        setDate()
        tableView.delegate = self
        tableView.dataSource = self
        presnter.attach()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        self.stopLoadingIndicator()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func productDetailesButtonAction(_ sender: UIButton) {
        
    }
}
extension ProductDetailsViewController {
    
    private func setupUI() {
        setupNaviagtionBarUI()
        addBarButtonsToNavigationBar()
        registerTableViewCell()
        setupTableViewRowHeight()
        updateProductDetailsHeadImage()
    }
    private func registerTableViewCell() {
        
        let productDetailsTableViewCell = UINib(nibName: "\(ProductDetailsTableViewCell.self)", bundle: nil)
        tableView.register(productDetailsTableViewCell, forCellReuseIdentifier: "\(ProductDetailsTableViewCell.self)")
        
        let moreLinks = UINib(nibName: "\(WebsiteLinkTableViewCell.self)", bundle: nil)
        tableView.register(moreLinks, forCellReuseIdentifier: "\(WebsiteLinkTableViewCell.self)")
    }
    private func setupTableViewRowHeight() {
        tableView.estimatedRowHeight = 30
        tableView.rowHeight = UITableView.automaticDimension
        
    }
    private func setupNaviagtionBarUI() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func addBarButtonsToNavigationBar() {
        navigationItem.leftBarButtonItems = [getLeftButton(), getTitleBarButton()]
        navigationItem.rightBarButtonItems = [getRightButton()]
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
        button.setImage(UIImage(named: presnter.images.productDetailesRightSign), for: .normal)
        button.backgroundColor = .paleGreyThree
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 17
        button.addTarget(self, action: #selector(presentDialogue), for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    
    private func getTitleBarButton() -> UIBarButtonItem {
        let titleLabel = UILabel()
        titleLabel.text = "تفاصيل المنتج"
        titleLabel.textColor = .purplishBrown
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.sizeToFit()
        return UIBarButtonItem(customView: titleLabel)
    }
    
    private func updateProductDetailsHeadImage() {
        productDetailsHeadImage.sd_setImage(with: URL(string: presnter.product.externalAssets?.first ?? ""))
    }
}

extension ProductDetailsViewController {
    @objc func didTappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    @objc func presentDialogue() {
        let vc = StandardAlertViewController(title: "هل تريد ارشفة المزرعة ؟", message: "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديدصورة حقيقية لتصميم الموقع.", delegate: self)
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: false, completion: nil)
    }
}
extension ProductDetailsViewController: StandardAlertViewControllerDelegate {
    func confirmButtonDidTapped(for alert: StandardAlertViewController) {
        dismiss(animated: false, completion: nil)
    }
    
    func cancelButtonDidTapped(for alert: StandardAlertViewController) {
        dismiss(animated: false, completion: nil)
    }
}
extension ProductDetailsViewController {
    private func setFont(){
        productDetailsCropsLabel.font  = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        productDetailsSupplierLabel.font = UIFont.get(enFont: .regular(14), arFont: .regular(14))
        productDetailsCityLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        productDetailsPriceLabel.font = UIFont.get(enFont: .regular(14), arFont: .regular(14))
        productDetailsCurrencyLabel.font = UIFont.get(enFont: .regular(14), arFont: .regular(14))
        productDetailsSupplierLabel.text = presnter.product.name//product.name
        productDetailsDescrptionProductLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        productDetailsDescrptionProductContentLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        productDetailsAdviceLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        productDetailsContentAdviceFirstLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        productDetailsContentAdviceSecondLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        productDetailsContentAdviceThirdLabel.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
        productDetailsButtonLabelTile.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        productDetailsButtonNumberLabelTitle.font = UIFont.get(enFont: .regular(13), arFont: .regular(13))
    }
    
    private func setDate(){
        productDetailsCropsLabel.text  = presnter.product.farmedType
        productDetailsCityLabel.text = presnter.product.city
        guard let price = presnter.product.price else {
            return
        }
        productDetailsPriceLabel.text = String(price)
        productDetailsDescrptionProductContentLabel.text = presnter.product.description
        productDetailsButtonNumberLabelTitle.text = presnter.product.sellerMobile
    }
    
}
extension ProductDetailsViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presnter.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch presnter.datasource[indexPath.row] {
        case let .city(city):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProductDetailsTableViewCell.self)", for: indexPath) as? ProductDetailsTableViewCell ?? ProductDetailsTableViewCell()
            cell.setupUI(model: city)
            return cell
        case let .region(region):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProductDetailsTableViewCell.self)", for: indexPath) as? ProductDetailsTableViewCell ?? ProductDetailsTableViewCell()
            cell.setupUI(model: region)
            return cell
            
        case let .suitableCrop(suitableCrop):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProductDetailsTableViewCell.self)", for: indexPath) as? ProductDetailsTableViewCell ?? ProductDetailsTableViewCell()
            cell.setupUI(model: suitableCrop)
            return cell
        case let .moreLinkes(moreLinkes):
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(WebsiteLinkTableViewCell.self)", for: indexPath) as? WebsiteLinkTableViewCell ?? WebsiteLinkTableViewCell()
            cell.delegate = self
            cell.setupUI(model: moreLinkes)
            return cell
        }
    }
}

extension ProductDetailsViewController : ProductDetailsViewProtocol{
    func stopIndicator() {
        self.stopLoadingIndicator()
    }
    
    func setDataToTableView() -> Product {
        return presnter.product
    }
}

extension ProductDetailsViewController : ProductDetailsOtherLinkProtocol {
    func otherLinkButtonDidTapped(_ cell: WebsiteLinkTableViewCell) {
        if let index = tableView.indexPath(for: cell) {
            if let url = NSURL(string: presnter.product.otherLinks ?? ""){
                UIApplication.shared.openURL(url as URL)
            }
        }
    }
}
