//
//  DriverDetailVC.swift
//  KukaAppsCase
//
//  Created by Abdülbaki Kaplan on 12/10/19.
//  Copyright © 2019 Abdülbaki Kaplan. All rights reserved.
//

import UIKit

class DriverDetailVC: UIViewController {
   
    @IBOutlet weak var driverImageView: UIImageView!
    @IBOutlet weak var driverAgeLabel: UILabel!
    @IBOutlet weak var driverTeamLabel: UILabel!
    
    var driverDetail: DriverDataList?
    var id: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Network.id = id
        getDriverDetail()
        
    }


    func getDriverDetail() {
        callGetDriverDetail(viewController: self) { (success, response) in
            if success {
                self.driverDetail = response
                self.setUIElement()
            }else {
                print(response.debugDescription)
            }
        }
    }
    
    
    func setUIElement() {
        let detailImageURL = driverDetail?.image
        driverImageView.kf.setImage(with: URL(string: detailImageURL ?? ""))
        driverAgeLabel.text = "\(driverDetail?.age ?? 0)"
        driverTeamLabel.text = driverDetail?.team
        self.navigationController?.navigationBar.isHidden = false
    }
}

extension DriverDetailVC {
    func callGetDriverDetail(viewController: UIViewController, completion: @escaping (_ result: Bool, _ getDriverDetailResponse: DriverDataList?) -> Void) {
        Network.getDriverDetail(viewController: viewController, id: id, parameters: nil) { (success, response) in
                   if success {
                     completion(true,response)
                 }else {
                     completion(false, nil)
                 }
            }
    }
}
