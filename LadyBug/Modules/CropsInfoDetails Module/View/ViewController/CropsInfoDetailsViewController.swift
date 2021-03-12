//
//  CropsInfoDetailsViewController.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/6/21.
//

import UIKit

class CropsInfoDetailsViewController: UIViewController, CropsInfoDetailsViewProtocol {
    @IBOutlet weak var cropsInfoImage: UIImageView!
    @IBOutlet weak var cropsInfoImageLabelTitle: UILabel!
    @IBOutlet weak var cropsInfoHeadImage: UIImageView!
    @IBOutlet weak var cropsInfoHeadLabelTitle: UILabel!
    @IBOutlet weak var cropsInfoSubjecLabel: UILabel!
    @IBOutlet weak var cropsInfoContentTextView: UITextView!
    private var presnter: CropsInfoDetailsPresenterProtocol!
    
    init() {
        super.init(nibName: "\(CropsInfoDetailsViewController.self)", bundle: nil)
        presnter = CropsInfoDetailsPresenter(view : self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupfont()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension CropsInfoDetailsViewController {
    private func setupUI() {
        setupNaviagtionBarUI()
        addBarButtonsToNavigationBar()
    }
    private func setupNaviagtionBarUI() {
        navigationController?.setNavigationBarHidden(false, animated: false)
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
        return UIBarButtonItem(customView: button)
    }
    
    private func getTitleBarButton() -> UIBarButtonItem {
        let titleLabel = UILabel()
        titleLabel.text = "اخبار عن التفاح"
        titleLabel.textColor = .purplishBrown
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.sizeToFit()
        return UIBarButtonItem(customView: titleLabel)
    }
    private func getRightButton() -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
        button.setImage(UIImage(named: presnter.images.share), for: .normal)
        button.backgroundColor = .paleGreyThree
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 17
        return UIBarButtonItem(customView: button)
    }
}
extension CropsInfoDetailsViewController {
    private func setupfont(){
        cropsInfoImageLabelTitle.font = UIFont.get(enFont: .regular(38), arFont: .regular(38))
        cropsInfoHeadLabelTitle.font = UIFont.get(enFont: .regular(14), arFont: .regular(14))
        cropsInfoSubjecLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        cropsInfoContentTextView.font = UIFont.get(enFont: .light(12), arFont: .light(12))
        cropsInfoImage.layer.maskedCorners = [.layerMaxXMaxYCorner   , .layerMinXMaxYCorner  ]
        cropsInfoImage.layer.cornerRadius = CGFloat(8.0)
        cropsInfoImage.clipsToBounds = true
    }
}
