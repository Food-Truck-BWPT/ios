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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpSignInSegmentedControl: UISegmentedControl!
    @IBOutlet weak var signUpSignInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpMap()
        setUpUserInterface()
    }
    
    func setUpMap() {

        let exampleLocation = CLLocation(latitude: 37.7749295, longitude: -122.4194155)
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 400000)
        let region = MKCoordinateRegion(center: exampleLocation.coordinate,
                                        latitudinalMeters: 50000,
                                        longitudinalMeters: 60000)
        backgroundMap.setRegion(region, animated: true)
        
        backgroundMap.isUserInteractionEnabled = true
        backgroundMap.setCameraZoomRange(zoomRange, animated: false)
        
        let foodTruckOne = Annotation(title: "King David Kalakaua",
                                      locationName: "Waikiki Gateway Park",
                                      discipline: "Sculpture",
                                      coordinate: CLLocationCoordinate2D(latitude: 37.549295,
                                                                         longitude: -122.4194155))
        
        let foodTruckTwo = Annotation(title: "",
                                      locationName: "",
                                      discipline: "",
                                      coordinate: CLLocationCoordinate2D(latitude: 37.549295,
                                                                         longitude: -122.4194155))
        backgroundMap.addAnnotation(foodTruckOne)
        backgroundMap.addAnnotation(foodTruckTwo)
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
        signUpSignInButton.setTitle("Sign Up", for: .normal)
        signUpSignInButton.tintColor = Colors.white
        signUpSignInButton.backgroundColor = Colors.orange
        signUpSignInButton.layer.cornerRadius = 5
        
        // Segmented Control
        signUpSignInSegmentedControl.setTitle("Sign Up", forSegmentAt: 0)
        signUpSignInSegmentedControl.setTitle("Login", forSegmentAt: 1)
        signUpSignInSegmentedControl.selectedSegmentTintColor = Colors.orange
        let segmentedControltitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        signUpSignInSegmentedControl.setTitleTextAttributes(segmentedControltitleTextAttributes, for: .selected)
        
    }
    
    @IBAction func signUpSignInSegmentedControlChanged(_ sender: UISegmentedControl) {
                
        if signUpSignInSegmentedControl.selectedSegmentIndex == 0 {
            print("segmented control changed to sign up")
            signUpSignInButton.setTitle("Sign Up", for: .normal)
            signUpSignInSegmentedControl.tintColor = .purple
        } else {
            print("segmented control changed to sign in")
            signUpSignInButton.setTitle("Login", for: .normal)
        }
    }
    
}

