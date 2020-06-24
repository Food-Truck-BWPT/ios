//
//  SearchTrucksViewController.swift
//  Food Truck Trackr
//
//  Created by Thomas Dye on 6/23/20.
//  Copyright © 2020 Thomas Dye. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SearchTrucksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate, CLLocationManagerDelegate {
    
    let arrayOfTrucks: [Truck] = [truckOne, truckTwo]
    let locationManager = CLLocationManager()
    let geoCoder = CLGeocoder()
    let annotation = MKPointAnnotation()
    
    @IBOutlet weak var searchTrucksTableView: UITableView!
    @IBOutlet weak var searchTrucksMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTrucksTableView.delegate = self
        searchTrucksTableView.dataSource = self

        // Do any additional setup after loading the view.
        convertAddressToCoordinates()
    }
    
    func convertAddressToCoordinates() {
                
        for trucks in arrayOfTrucks {
            print("current truck: \(trucks.name)")
            geoCoder.geocodeAddressString(trucks.currentLocation.location) { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let location = placemarks.first?.location
                
            else {
                print("location not found!")
                return
            }
                
                
            // Use your location
            print("location from function:\(location)")
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            self.annotation.coordinate = CLLocationCoordinate2D(latitude: latitude,
                                                                longitude: longitude)
                self.annotation.title = trucks.name
            self.searchTrucksMapView.addAnnotation(self.annotation)
                
            }
        }
    }
    
    // MARK: Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfTrucks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TruckCell", for: indexPath)
        cell.textLabel?.text = arrayOfTrucks[indexPath.row].name
        cell.detailTextLabel?.text = arrayOfTrucks[indexPath.row].cuisineType
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // MARK: Location Manager
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude,
                                            longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center,
                                        span: MKCoordinateSpan(latitudeDelta: 0.02,
                                                               longitudeDelta: 0.02))
        self.searchTrucksMapView.setRegion(region,
                                           animated: true)
        self.locationManager.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Errors " + error.localizedDescription)
    }
}
