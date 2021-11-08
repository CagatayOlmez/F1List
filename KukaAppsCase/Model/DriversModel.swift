//
//  DriversModel.swift
//  KukaAppsCase
//
//  Created by Abdülbaki Kaplan on 12/10/19.
//  Copyright © 2019 Abdülbaki Kaplan. All rights reserved.
//

import Foundation

// MARK: - DriversModel
class DriversModel: Codable {
    let items: [DriverItem]?

    init(items: [DriverItem]?) {
        self.items = items
    }
}

// MARK: - DriverItem
class DriverItem: Codable {
    let id: Int?
    let name: String?
    let point: Int?
    var isFav: Bool? = false
    
    init(id: Int?, name: String?, point: Int?) {
        self.id = id
        self.name = name
        self.point = point
    }
}


