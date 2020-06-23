//
//  Location.swift
//  Food Truck Trackr
//
//  Created by Thomas Dye on 6/22/20.
//  Copyright © 2020 Thomas Dye. All rights reserved.
//

import Foundation

struct Location {
    var location: String
    var departureTime: String
    var nextLocation: NextLocation
}

struct NextLocation {
    var location: String
    var arrivalTime: Date
    var departureTime: Date
}
