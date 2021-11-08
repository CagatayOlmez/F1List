//
//  DriverDetailModel.swift
//  KukaAppsCase
//
//  Created by Abdülbaki Kaplan on 12/10/19.
//  Copyright © 2019 Abdülbaki Kaplan. All rights reserved.
//

import Foundation


class DriverDataList: Codable {
    let id, age: Int?
    let image: String?
    let team: String?

    init(id: Int?, age: Int?, image: String?, team: String?) {
        self.id = id
        self.age = age
        self.image = image
        self.team = team
    }
}
