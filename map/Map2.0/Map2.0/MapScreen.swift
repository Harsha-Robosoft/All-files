import MapKit

import UIKit



class ViewController: UIViewController {

    

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.mapType = .satellite

        LocationManager.shared.getUserLocation{

            [weak self] location in

            DispatchQueue.main.async {

                guard let strongSelf = self else{

                    return

                }

                let pin = MKPointAnnotation()

                pin.coordinate = location.coordinate

                strongSelf.mapView.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)), animated: true)

                strongSelf.mapView.addAnnotation(pin)

            }

        }

    }

    private func customPin(){

        let pin = MKPointAnnotation()

        pin.title = "Iam Here"

        pin.subtitle = "Hey"

        mapView.addAnnotation(pin)

    }

    

    

}
