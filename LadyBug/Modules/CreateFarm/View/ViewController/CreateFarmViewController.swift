//
//  CreateFarmViewController.swift
//  LadyBug
//
//  Created by SAMEH on 24/03/2021.
//

import UIKit

class CreateFarmViewController: UIViewController {
    
    @IBOutlet weak var plantTypeSelection: StandardSelectionView!
    @IBOutlet weak var plantNameSelection: CustomSelectionView!
    @IBOutlet weak var packageSelection: StandardSelectionView!
    @IBOutlet weak var numberOfPlantsField: StandardTextFieldView!
    @IBOutlet weak var locationSelection: CustomSelectionView!
    @IBOutlet weak var dateSelection: DateSelectionView!
    @IBOutlet weak var lightSelection: StandardSelectionView!
    @IBOutlet weak var seedingSelection: StandardSelectionView!
    @IBOutlet weak var createFarmButton: UIButton!
    @IBOutlet weak var hintLabel: UILabel!
    
    var presnter: CreateFarmPresenterProtocol!
    var selectedCoordinate: Coordinate?
    
    init() {
        super.init(nibName: "\(CreateFarmViewController.self)", bundle: nil)
        presnter = CreateFramPresenter(view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presnter.attach()
       
    }

}

extension CreateFarmViewController {
    private func setupUI() {
        setupNaviagtionBarUI()
        addBarButtonsToNavigationBar()
        setupNumberOfPlantsField()
        setupPlantTypeSelection()
        setupPlantNameSelection()
        setupPackageSelection()
        setupLocationSelection()
        setupDateSelectionView()
        setupLightSelection()
        setupSeedingSelection()
        setupCreateFarmButton()
        setupHintLabel()
    }
    
    private func setupNaviagtionBarUI() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func addBarButtonsToNavigationBar() {
        navigationItem.leftBarButtonItems = [getLeftButton(), getTitleBarButton()]
        
        navigationItem.rightBarButtonItems = [getCheckButton()]
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
    
    private func getTitleBarButton() -> UIBarButtonItem {
        let titleLabel = UILabel()
        titleLabel.text = presnter.localizer.title
        titleLabel.textColor = .purplishBrown
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.sizeToFit()

        return UIBarButtonItem(customView: titleLabel)
    }
    
    private func getCheckButton() -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 51, height: 34))
        button.setTitle("Y123", for: .normal)
        button.backgroundColor = .paleGreyThree
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 17
        return UIBarButtonItem(customView: button)
    }
    
    private func setupNumberOfPlantsField() {
        numberOfPlantsField.setupSpacing(insets: .zero)
        numberOfPlantsField.setupUI(isPasswordField: false, placeholder: presnter.localizer.numberOfPlants, nextButton: false)
        numberOfPlantsField.setupFloatingTitle(with: presnter.localizer.numberOfPlants)
    }
    
    private func setupPlantTypeSelection() {
        plantTypeSelection.setupUI(title: presnter.localizer.plantType, selectionTitle: presnter.localizer.plantType)
    }
    
    private func setupPlantNameSelection() {
        plantNameSelection.setupUI(title: presnter.localizer.plantName, placeholder: "كلاثيا", image: "flower", arrowImage: presnter.images.dropDownImage)
    }
    
    private func setupPackageSelection() {
        packageSelection.setupUI(title: presnter.localizer.packageSize, selectionTitle: presnter.localizer.packageSize)
    }
    
    private func setupLocationSelection() {
        locationSelection.setupUI(title: presnter.localizer.locationTitle, placeholder: presnter.localizer.locationPlaceholder, image: nil, arrowImage: presnter.images.location)
        locationSelection.delegate = self
    }
    
    private func setupDateSelectionView() {
        dateSelection.setupTitle(with: presnter.localizer.date)
    }
    
    private func setupLightSelection() {
        lightSelection.setupUI(title: presnter.localizer.lightTitle, selectionTitle: "إضائة ضعيفة", placeholderColor: .purplishBrown)
    }
    
    private func setupSeedingSelection() {
        seedingSelection.setupUI(title: presnter.localizer.seedingTitle, selectionTitle: "46 هاي تك", placeholderColor: .purplishBrown)
    }
    
    private func setupCreateFarmButton() {
        createFarmButton.setTitle(presnter.localizer.createFarm, for: .normal)
        createFarmButton.titleLabel?.font = UIFont.get(enFont: .bold(16), arFont: .bold(16))
    }
    
    private func setupHintLabel() {
        let attribuitedString = NSMutableAttributedString()
        attribuitedString.append(NSAttributedString(string: presnter.localizer.hint1, attributes: [NSAttributedString.Key.foregroundColor : UIColor.purplishBrown, NSAttributedString.Key.font: UIFont.get(enFont: .regular(12), arFont: .regular(12))]))
        attribuitedString.append(NSAttributedString(string: presnter.localizer.hint2, attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkishGreen, NSAttributedString.Key.font: UIFont.get(enFont: .regular(12), arFont: .regular(12))]))
        hintLabel.attributedText = attribuitedString
    }
}

extension CreateFarmViewController: CreateFarmViewProtocol {
    
}

extension CreateFarmViewController {
    @objc func didTappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension CreateFarmViewController: CustomSelectionViewDelegate {
    func selectionDidTapped(_ selection: CustomSelectionView) {
        let vc = MapViewController()
        vc.delegate = self
        vc.selectedCoordinate = selectedCoordinate
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension CreateFarmViewController: MapViewDelegate {
    func didSelectLocationFromMap(coordinate: Coordinate) {
        locationSelection.updateSelectionValue(text: coordinate.address ?? "")
        selectedCoordinate = coordinate
    }
}
