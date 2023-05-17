import UIKit
import MapKit
import RxSwift
import RxCocoa

class LocationViewModel: NSObject, CLLocationManagerDelegate {
    static let shared = LocationViewModel()

    private let locationManager = CLLocationManager()
    private let currentLocationSubject = PublishSubject<CLLocation?>()
    private var destination: String?

    var currentLocation: Observable<CLLocation?> {
        return currentLocationSubject.asObservable()
    }

    private override init() {
        super.init()
        locationManager.delegate = self
    }

    func requestLocationPermission() {
        locationManager.requestWhenInUseAuthorization()
    }

    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }

    func setDestination(_ destination: String) {
        self.destination = destination
    }

    // CLLocationManagerDelegate methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            currentLocationSubject.onNext(location)
        }
    }
}
