//
//  MapViewController.swift
//  LadyBug
//
//  Created by SAMEH on 12/03/2021.
//

import UIKit
import GoogleMaps

protocol MapViewDelegate: class {
    func didSelectLocationFromMap(coordinate: Coordinate)
}

class MapViewController: UIViewController {
    
    @IBOutlet weak var addressView: UIView!
    @IBOutlet var mapView: GMSMapView!
    @IBOutlet var pinView: MapPinView!
    @IBOutlet var addressLablel: UILabel!
    @IBOutlet var selectLocationButton: UIButton!
    
    let images = MapImages()
    let localizer = MapLocalizer()
    let service = ReverseGeocodeService()
    var locationManager = CLLocationManager()
    
    var selectedCoordinate: Coordinate?

    weak var delegate: MapViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDelegates()
        setupUI()
    }

    private func setupDelegates() {
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.startUpdatingLocation()

    }
    
}

extension MapViewController {
    private func setupUI() {
        setupMapViewStyle()
        setupMapViewInsets()
        setupNaviagtionBarUI()
        addBarButtonsToNavigationBar()
        setupLabels()
    }

    private func setupMapViewStyle() {
        do {
            if let path = Bundle.main.path(forResource: "MapStyle", ofType: "json") {
                let url = URL(fileURLWithPath: path)
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: url)
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
    }
    
    private func setupMapViewInsets() {
        mapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: addressView.bounds.height + view.safeAreaInsets.bottom, right: 0)
    }
    
    private func setupNaviagtionBarUI() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func addBarButtonsToNavigationBar() {
        navigationItem.leftBarButtonItems = [getLeftButton(), getTitleBarButton()]
        
        navigationItem.rightBarButtonItems = [getCloseButton()]
    }
    
    private func getLeftButton() -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
        button.setImage(UIImage(named: images.back), for: .normal)
        button.backgroundColor = .paleGreyThree
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 17
        button.addTarget(self, action: #selector(didTappedBackButton), for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    
    private func getTitleBarButton() -> UIBarButtonItem {
        let titleLabel = UILabel()
        titleLabel.text = localizer.title
        titleLabel.textColor = .purplishBrown
        titleLabel.font = UIFont.get(enFont: .regular(16), arFont: .regular(16))
        titleLabel.sizeToFit()

        return UIBarButtonItem(customView: titleLabel)
    }
    
    private func getCloseButton() -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
        button.setImage(UIImage(named: images.close), for: .normal)
        button.backgroundColor = .paleGreyThree
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 17
        return UIBarButtonItem(customView: button)
    }
    
    private func setupLabels() {
        addressLablel.font = UIFont.get(enFont: .regular(14), arFont: .regular(14))
        addressLablel.textColor = .purplishBrown
        selectLocationButton.titleLabel?.font = UIFont.get(enFont: .bold(16), arFont: .bold(16))
    }
}

extension MapViewController: GMSMapViewDelegate {
    func mapView(_: GMSMapView, idleAt position: GMSCameraPosition) {
        service.reverseGeocodeToAddress(lat: position.target.latitude, long: position.target.longitude) { [weak self] address in
            self?.addressLablel.text = address
            self?.selectedCoordinate = Coordinate(longitude: position.target.longitude, latitude: position.target.latitude, address: address)
        }
    }

    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        if gesture {
            pinView.hideMessgeView()
            mapView.selectedMarker = nil
        }
    }

    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        mapView.selectedMarker = nil
        
        return false
    }
}

extension MapViewController {
    @objc func didTappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectLocationButtonDidTapped(_ sender: Any) {
        guard let coord = selectedCoordinate else { return }
        delegate?.didSelectLocationFromMap(coordinate: coord)
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let location = locations.last

        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)

        self.mapView?.animate(to: camera)

        self.locationManager.stopUpdatingLocation()
    }
}
