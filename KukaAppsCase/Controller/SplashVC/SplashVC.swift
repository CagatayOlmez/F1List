//
//  SplashVC.swift
//  KukaAppsCase
//
//  Created by Abdülbaki Kaplan on 12/10/19.
//  Copyright © 2019 Abdülbaki Kaplan. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setStartingView(nibName: "DriverVC")
    }

    func setStartingView(nibName: String) {
        
        if nibName == "DriverVC" {
            let vc = DriverVC(nibName: nibName, bundle: nil)
            self.navigationController?.setViewControllers([vc], animated: true)
        }
    }

}
