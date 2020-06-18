//
//  LogInViewController.swift
//  Food Truck Trackr
//
//  Created by Thomas Dye on 6/17/20.
//  Copyright © 2020 Thomas Dye. All rights reserved.
//

import UIKit
import MapKit

class LogInViewController: UIViewController {

    @IBOutlet weak var backgroundMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpMap()
    }
    
    func setUpMap() {

        let sanFrancisco = CLLocation(latitude: 37.7749295, longitude: -122.4194155)
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 400000)
        let region = MKCoordinateRegion(center: sanFrancisco.coordinate,
                                        latitudinalMeters: 50000,
                                        longitudinalMeters: 60000)
        backgroundMap.isUserInteractionEnabled = false
        backgroundMap.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
        backgroundMap.setCameraZoomRange(zoomRange, animated: false)
    }
}

