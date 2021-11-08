//
//  DriverViewModel.swift
//  KukaAppsCase
//
//  Created by Abdülbaki Kaplan on 12/13/19.
//  Copyright © 2019 Abdülbaki Kaplan. All rights reserved.
//

import Foundation


class DriverViewModel {
    
    var isFaved = false
    
    func addToReadingList(id: Int) {
        var favListArray = UserDefaults.standard.array(forKey: "favList") ?? [Int]()
        
        if let favListStringArray = favListArray as? [Int] {
            if let index = favListStringArray.index(of: id) {
                isFaved = false
                favListArray.remove(at: index)
            } else {
                isFaved = true
                favListArray.append(id)
            }
        }

        UserDefaults.standard.set(favListArray, forKey: "favList")
        UserDefaults.standard.synchronize()

    }
}
