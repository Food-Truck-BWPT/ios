//
//  DinerLogInViewController.swift
//  Food Truck Trackr
//
//  Created by Thomas Dye on 6/17/20.
//  Copyright © 2020 Thomas Dye. All rights reserved.
//

import UIKit
import MapKit

class DinerLogInViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var backgroundMap: MKMapView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpLoginSegmentedControl: UISegmentedControl!
    @IBOutlet weak var signUpSignInButton: UIButton!
    @IBOutlet weak var operatorButton: UIButton!
    
    var locationManager: CLLocationManager!
    
    // Initial locations
    var userCurrentLocation: CLLocation = CLLocation(latitude: 0,
                                                     longitude: 0)
    
    var userLatitude: Double = 0
    var userLongitude: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        determineMyCurrentLocation()
        setUpMap()
        setUpUserInterface()
    }
    
    func setUpMap() {
        backgroundMap.register(
            ArtworkMarkerView.self,
            forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        let region = MKCoordinateRegion(center: userCurrentLocation.coordinate,
                                        latitudinalMeters: 1_000,
                                        longitudinalMeters: 1_000)
        
        backgroundMap.setRegion(region, animated: true)
        backgroundMap.isUserInteractionEnabled = true
        backgroundMap.showsUserLocation = true
        backgroundMap.tintColor = Colors.orange
    }
    
    func setUpUserInterface() {
        // Title
        titleLabel.textColor = Colors.orange
        titleLabel.backgroundColor = Colors.darkGray
        
        // Username Text Field
        usernameTextField.placeholder = "username"
        usernameTextField.textAlignment = .center
        usernameTextField.tintColor = Colors.orange
        
        // Password Text Field
        passwordTextField.placeholder = "password"
        passwordTextField.textAlignment = .center
        passwordTextField.tintColor = Colors.orange
        
        // Sign Up / Sign In Button
        signUpSignInButton.setTitle("Login", for: .normal)
        signUpSignInButton.tintColor = Colors.white
        signUpSignInButton.backgroundColor = Colors.orange
        signUpSignInButton.layer.cornerRadius = 5
        
        // Operator Button
        operatorButton.setTitle("Login As Operator", for: .normal)
        
        // Segmented Control
        signUpLoginSegmentedControl.setTitle("Login", forSegmentAt: 0)
        signUpLoginSegmentedControl.setTitle("Sign Up", forSegmentAt: 1)
        signUpLoginSegmentedControl.selectedSegmentTintColor = Colors.orange
        let segmentedControltitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        signUpLoginSegmentedControl.setTitleTextAttributes(segmentedControltitleTextAttributes, for: .selected)
        
    }
    
    func zoomOut() {
        UIView.animate(withDuration: 2) {
            let region = MKCoordinateRegion(center: self.userCurrentLocation.coordinate,
                                            latitudinalMeters: 30_000,
                                            longitudinalMeters: 30_000)
            self.backgroundMap.setRegion(region, animated: true)
        }
    }
    
    func zoomIn() {
        UIView.animate(withDuration: 2) {
            let region = MKCoordinateRegion(center: self.userCurrentLocation.coordinate,
                                        latitudinalMeters: 1_000,
                                        longitudinalMeters: 1_000)
            self.backgroundMap.setRegion(region, animated: true)
        }
    }
    
    // Determine Current Location
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            locationManager.startUpdatingHeading()
        }
    }
    
    // Location manager to set userLocation, center, and region
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        
        // Set userLocation
        let userLocation: CLLocation = locations[0] as CLLocation
        
        // Set center
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude,
                                            longitude: userLocation.coordinate.longitude)
        
        // Set region attritbutes
        let region = MKCoordinateRegion(center: center,
                                        latitudinalMeters: 30_000,
                                        longitudinalMeters: 30_000)
        // Set region on mapview
        self.backgroundMap.setRegion(region,
                               animated: true)
        
        // Stops updating the current location
        manager.stopUpdatingLocation()
        // Set coordinates to userCurrentLocation
        userCurrentLocation = CLLocation(latitude: userLocation.coordinate.latitude,
                                         longitude: userLocation.coordinate.longitude)
        
        userLatitude = userLocation.coordinate.latitude
        userLongitude = userLocation.coordinate.longitude
        print("lattttt: \(userLatitude)")
        
        let foodTruckOne = Artwork(title: "Taco Stand",
                                   locationName: "Gateway Park",
                                   discipline: "Open",
                                   coordinate: CLLocationCoordinate2D(latitude: userLatitude - 0.08,
                                                                      longitude: userLongitude + 0.08))
        
        let foodTruckTwo = Artwork(title: "Korean BBQ",
                                   locationName: "North Trail Lane",
                                   discipline: "Open",
                                   coordinate: CLLocationCoordinate2D(latitude: userLatitude + 0.1,
                                                                         longitude: userLongitude - 0.05))
        
        let foodTruckThree = Artwork(title: "Aaron's Fried Chicken",
                                     locationName: "Town Center",
                                     discipline: "Open",
                                     coordinate: CLLocationCoordinate2D(latitude: userLatitude - 0.01,
                                                                      longitude: userLongitude + 0.1))
        let foodTruckFour = Artwork(title: "Pizza Truck",
                                    locationName: "Cherry Blossom Lane",
                                    discipline: "Closed",
                                    coordinate: CLLocationCoordinate2D(latitude: userLatitude - 0.04,
                                                                       longitude: userLongitude + 0.03))
        let foodTruckFive = Artwork(title: "Sushi 2 Go",
                                    locationName: "Wandering Pines",
                                    discipline: "Open",
                                    coordinate: CLLocationCoordinate2D(latitude: userLatitude - 0.04,
                                           longitude: userLongitude - 0.03))
        
        func addAnnotationsToMap() {
            let annotations: [MKAnnotation] = [foodTruckOne, foodTruckTwo, foodTruckThree, foodTruckFour, foodTruckFive]
            
            for annotation in annotations {
                backgroundMap.addAnnotation(annotation)
            }
        }
        
        addAnnotationsToMap()
    }
    
    // Location manager failed
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error)
    {
        print("Error \(error)")
    }
    
    
    // MARK: IBOUTLETS
    
    @IBAction func signUpLoginSegmentedControlChanged(_ sender: UISegmentedControl) {
                
        if signUpLoginSegmentedControl.selectedSegmentIndex == 0 {
            print("segmented control changed to login")
            signUpSignInButton.setTitle("Login", for: .normal)
            operatorButton.setTitle("Login As Operator", for: .normal)
            signUpLoginSegmentedControl.tintColor = .purple
            zoomOut()
        } else {
            print("segmented control changed to sign up")
            signUpSignInButton.setTitle("Sign Up", for: .normal)
            operatorButton.setTitle("Sign Up As Operator", for: .normal)
            zoomIn()
        }
    }
    
    
    @IBAction func signUpLoginButtonTapped(_ sender: UIButton) {
        
        // Programmatic segue set-up
        guard let username = usernameTextField.text,
            let password = passwordTextField.text,
            !username.isEmpty,
            !password.isEmpty
            else { return } // Set up an alert controller to tell the user to enter stuff.
        
        // Check segmented control
        // Sign up or login?
        
        if signUpLoginSegmentedControl.selectedSegmentIndex == 0 {
            // code for sign up
            print("user logged in")
        } else {
            // code for login
            print("user signed in")
            
        }
        
        // Actual Programmatic segue
        performSegue(withIdentifier: "SegueName", sender: self) // Make an actual segue and give it an identifier
    }
    
}

