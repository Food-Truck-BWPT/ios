//
//  Truck.swift
//  Food Truck Trackr
//
//  Created by Thomas Dye on 6/22/20.
//  Copyright © 2020 Thomas Dye. All rights reserved.
//


//* `imageOfTruck`: Image or image URL
//
//* `cuisineType`: String
//
//* `customerRatings`: Array of all `customerRating` values
//
//* `customerRatingAvg`: Integer equal to the mean of the values contained in the `truck`s `customerRatings` array.

import Foundation
import UIKit

struct Truck {
    var name: String
    var imageOfTruck: String
    var cuisineType: String
    var customerRatings: [Int]
    var customerRatingAve: Int
    var menu: [MenuItem]
    var currentLocation: Location
}

let truckOne = Truck(name: "truck one",
                     imageOfTruck: "image of truck one",
                     cuisineType: "mexican",
                     customerRatings: [4,4,4],
                     customerRatingAve: 4,
                     menu: [MenuItem(itemName: "taco",
                     itemDescription: "spicy tacos",
                     itemPhotos: ["image one", "image two"],
                     customerRatings: [4,4,4],
                     customerRatingAvg: 4)],
                     currentLocation: Location(location: "5211 Fairmont Street, Jacksonville, FL 32207",
                                               departureTime: "5PM",
                                               nextLocation: NextLocation(location: "321 address street",
                                                                          arrivalTime: Date(),
                                                                          departureTime: Date())))

let truckTwo = Truck(name: "truck two",
                     imageOfTruck: "image of truck two",
                     cuisineType: "pizza",
                     customerRatings: [4,4,4],
                     customerRatingAve: 4,
                     menu: [MenuItem(itemName: "pepperoni pizza",
                                     itemDescription: "delicious pepperoni",
                                     itemPhotos: ["image one", "image two"],
                                     customerRatings: [4,4,4],
                                     customerRatingAvg: 4)],
                     currentLocation: Location(location: "11964 Elizabeth Ann Court, Jacksonville, FL 32223",
                                               departureTime: "4PM",
                                               nextLocation: NextLocation(location: "333 cool st",
                                                                          arrivalTime: Date(),
                                                                          departureTime: Date())))
