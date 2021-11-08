//
//  DriverTableViewCell.swift
//  KukaAppsCase
//
//  Created by Abdülbaki Kaplan on 12/10/19.
//  Copyright © 2019 Abdülbaki Kaplan. All rights reserved.
//

import UIKit

class DriverTableViewCell: UITableViewCell {
 
    @IBOutlet weak var driverNameLabel: UILabel!
    @IBOutlet weak var driverPointLabel: UILabel!
    @IBOutlet weak var driverStarImage: UIImageView!
    @IBOutlet weak var shadowView: UIView!
  
    var driversItem: DriverItem?
    var favDidClicked: (() -> ())?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        setShadowView()
    }
    
    func setCell() {
        driverNameLabel.text = driversItem?.name
        driverPointLabel.text = "\(driversItem?.point ?? 0) Point"
        let array: [Int] = UserDefaults.standard.array(forKey: "favList") as! [Int]
        for item in array {
            if item == self.driversItem?.id {
                driverStarImage.image = UIImage(named: "star-2")
                driversItem?.isFav = true
            }else {
                driversItem?.isFav = false
            }
        }
    }
    
    func setShadowView() {
        shadowView.dropShadowView2()
    }

    @IBAction func favButtonClicked(_ sender: Any) {
        favDidClicked?()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
