//
//  HelpViewController.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/19/21.
//

import UIKit

class HelpViewController: UIViewController, HelpviewProtocol {
    
    @IBOutlet weak var helpTextViewContent: UITextView!
    
    private var presnter: HelpPresenterProtocol!
         init() {
             super.init(nibName: "\(HelpViewController.self)", bundle: nil)
             presnter = HelpPresenter(view : self )
         }
    
    @available(*, unavailable)
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fontSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func fontSetup(){
        helpTextViewContent.font = UIFont.get(enFont: .regular(12), arFont: .regular(12))
    }
    
}
extension HelpViewController {
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
    }
    
    private func getLeftButton() -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
        button.setImage(UIImage(named: presnter.image.back), for: .normal)
        button.backgroundColor = .paleGreyThree
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 17
        button.addTarget(self, action: #selector(didTappedBackButton), for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    
    private func getTitleBarButton() -> UIBarButtonItem {
        let titleLabel = UILabel()
        titleLabel.text = presnter.localizer.navigationitlesHelp
        titleLabel.textColor = .purplishBrown
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.sizeToFit()
        return UIBarButtonItem(customView: titleLabel)
    }
    
}
extension HelpViewController {
    @objc func didTappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
