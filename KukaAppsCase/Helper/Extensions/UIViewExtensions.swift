//
//  UIViewExtensions.swift
//  KukaAppsCase
//
//  Created by Abdülbaki Kaplan on 12/10/19.
//  Copyright © 2019 Abdülbaki Kaplan. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  
 func dropShadowView2() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        self.layer.shadowRadius = 2
        self.layer.cornerRadius = 14
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
            
   }
}
