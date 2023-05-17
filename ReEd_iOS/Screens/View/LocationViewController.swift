//
//  LocationViewController.swift
//  ReEd_iOS
//
//  Created by 김건우 on 2023/05/17.
//

//import UIKit
//import MapKit
//
//class LocationViewController: UIViewController {
//    private let mapView = MKMapView()
//    private let destinationTextField = UITextField()
//
//    private let locationManager = CLLocationManager()
//    private let viewModel = LocationViewModel() // ViewModel 인스턴스 추가
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setupUI()
//
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
//
//        mapView.delegate = self
//    }
//
//    private func setupUI() {
//        mapView.frame = view.bounds
//        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.addSubview(mapView)
//
//        destinationTextField.frame = CGRect(x: 20, y: 20, width: 200, height: 30)
//        view.addSubview(destinationTextField)
//
//        let selectDestinationButton = UIButton(type: .system)
//        selectDestinationButton.frame = CGRect(x: 20, y: 60, width: 100, height: 30)
//        selectDestinationButton.setTitle("Select", for: .normal)
//        selectDestinationButton.addTarget(self, action: #selector(selectDestinationButtonTapped), for: .touchUpInside)
//        view.addSubview(selectDestinationButton)
//    }
//
//    @objc private func selectDestinationButtonTapped() {
//        guard let destination = destinationTextField.text else { return }
//
//        viewModel.setDestination(destination) // ViewModel의 인스턴스 메서드 호출
//    }
//}
//
//extension LocationViewController: MKMapViewDelegate {
//    // 경로를 표시하기 위한 오버레이 추가
//    func showRouteOverlay() {
//        guard let route = viewModel.route else { return }
//
//        // 기존 경로 오버레이 제거
//        mapView.removeOverlays(mapView.overlays)
//
//        // 경로 오버레이 추가
//        let polyline = route.polyline
//        mapView.addOverlay(polyline)
//    }
//
//    // 경로 오버레이 뷰 설정
//    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//        if let polyline = overlay as? MKPolyline {
//            let renderer = MKPolylineRenderer(polyline: polyline)
//            renderer.strokeColor = UIColor.blue
//            renderer.lineWidth = 3
//            return renderer
//        }
//
//        return MKOverlayRenderer()
//    }
//}
//
//
