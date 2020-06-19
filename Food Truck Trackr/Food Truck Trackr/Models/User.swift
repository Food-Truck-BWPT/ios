//
//  User.swift
//  Food Truck Trackr
//
//  Created by Chris Price on 6/18/20.
//  Copyright © 2020 Thomas Dye. All rights reserved.
//

import Foundation

// This will need editing to conform to Christian's data structures in the API. Just a rough draft.

struct User: Codable {
    let username: String
    let password: String
}
