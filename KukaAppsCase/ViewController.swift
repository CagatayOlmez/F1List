//
//  ViewController.swift
//  KukaAppsCase
//
//  Created by Abdülbaki Kaplan on 12/10/19.
//  Copyright © 2019 Abdülbaki Kaplan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        openDriverVC()
        navigationController?.navigationBar.isHidden = true
        
    }
    

    func openDriverVC() {
        let driverVC = DriverVC.init(nibName: "DriverVC", bundle: nil)
        self.navigationController?.pushViewController(driverVC, animated: true)
    }

}
