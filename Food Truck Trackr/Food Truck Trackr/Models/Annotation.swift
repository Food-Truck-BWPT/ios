//
//  FoodTruckAnnotation.swift
//  Food Truck Trackr
//
//  Created by Thomas Dye on 6/17/20.
//  Copyright © 2020 Thomas Dye. All rights reserved.
//

import Foundation
import MapKit

class Annotation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String?
    let discipline: String?
    let coordinate: CLLocationCoordinate2D

    init(
        title: String?,
        locationName: String?,
        discipline: String?,
        coordinate: CLLocationCoordinate2D
    ) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate

        super.init()
    }

    var subtitle: String? {
        return locationName
    }
    
    var markerTintColor: UIColor  {
      switch discipline {
      case "Monument":
        return .red
      case "Mural":
        return .cyan
      case "Plaque":
        return .blue
      case "Sculpture":
        return .purple
      default:
        return .green
      }
    }
}
