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
    var nextLocation: NextLocation
}
