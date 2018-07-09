//
//  ViewController.swift
//  testMapKit
//
//  Created by osu on 2018/07/09.
//  Copyright © 2018 osu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!

    let regions: [CLLocationCoordinate2D] = [
        CLLocationCoordinate2D(latitude: CLLocationDegrees(35.686186), longitude: CLLocationDegrees(139.765556)),
        CLLocationCoordinate2D(latitude: CLLocationDegrees(35.68621297), longitude: CLLocationDegrees(139.766499)),
        CLLocationCoordinate2D(latitude: CLLocationDegrees(35.68623995), longitude: CLLocationDegrees(139.7674419)),
        CLLocationCoordinate2D(latitude: CLLocationDegrees(35.68626692), longitude: CLLocationDegrees(139.7683849)),
        CLLocationCoordinate2D(latitude: CLLocationDegrees(35.68629389), longitude: CLLocationDegrees(139.7693278)),
        CLLocationCoordinate2D(latitude: CLLocationDegrees(35.68377212), longitude: CLLocationDegrees(139.7656589)),
        CLLocationCoordinate2D(latitude: CLLocationDegrees(35.6837991), longitude: CLLocationDegrees(139.7666019)),
        CLLocationCoordinate2D(latitude: CLLocationDegrees(35.68382607), longitude: CLLocationDegrees(139.7675448)),
        CLLocationCoordinate2D(latitude: CLLocationDegrees(35.68385304), longitude: CLLocationDegrees(139.7684878)),
        CLLocationCoordinate2D(latitude: CLLocationDegrees(35.68388002), longitude: CLLocationDegrees(139.7694307)),
    ]

    public func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard overlay is MKCircle else {
            return MKOverlayRenderer()
        }

        let circleRender = MKCircleRenderer(overlay: overlay)
        circleRender.strokeColor = #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)
        circleRender.fillColor = #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 0.4)
        circleRender.lineWidth = 1
        return circleRender
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        regions.forEach { (r) in
            map.add(MKCircle(center: r, radius: 100))
        }

        if let r = regions.first {
            let mkSpan = MKCoordinateSpan(latitudeDelta: CLLocationDegrees(0.01), longitudeDelta: CLLocationDegrees(0.01))
            let mkRegion = MKCoordinateRegion(center: r, span: mkSpan)
            map.setRegion(mkRegion, animated: true)
        }
    }
}
