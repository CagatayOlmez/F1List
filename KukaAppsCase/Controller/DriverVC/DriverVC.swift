//
//  DriverVC.swift
//  KukaAppsCase
//
//  Created by Abdülbaki Kaplan on 12/10/19.
//  Copyright © 2019 Abdülbaki Kaplan. All rights reserved.
//

import UIKit

class DriverVC: UIViewController {

    @IBOutlet weak var driverTableView: UITableView!
    
    var driversItem: DriversModel?
    var viewModel = DriverViewModel()
    var isFaved = false
    override func viewDidLoad() {
        super.viewDidLoad()

        setUIElements()
        getDriverList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    

    func setUIElements() {
        driverTableView.register(UINib(nibName: "DriverTableViewCell", bundle: nil), forCellReuseIdentifier: "DriverTableViewCell")
        driverTableView.delegate = self
        driverTableView.dataSource = self
        driverTableView.separatorStyle = .none
    }


    func getDriverList() {
        callGetDriver(viewController: self) { (success, response) in
            response?.items?.sorted(by: { (sort1, sort2) -> Bool in
                return sort1.point! > sort2.point!
            })
            self.driversItem = response
            self.driverTableView.reloadData()
        }
    }


}

extension DriverVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return driversItem?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DriverTableViewCell", for: indexPath) as! DriverTableViewCell
        cell.selectionStyle = .none
        cell.driversItem = driversItem?.items?[indexPath.row]
        UserDefaults.standard.set(isFaved, forKey: "isFaved")
        cell.setCell()
        cell.favDidClicked = {
            self.viewModel.addToReadingList(id: self.driversItem?.items?[indexPath.row].id ?? 0)
            if self.viewModel.isFaved == false {
                cell.driverStarImage.image = UIImage(named: "star")
                self.viewModel.isFaved = true
            }else {
                cell.driverStarImage.image = UIImage(named: "star-2")
                self.viewModel.isFaved = false
            }
        }

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DriverDetailVC.init(nibName: "DriverDetailVC", bundle: nil)
        detailVC.id = "\(driversItem?.items?[indexPath.row].id ?? 0)"
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}
extension DriverVC {
   
        func callGetDriver(viewController: UIViewController, completion: @escaping (_ result: Bool, _ getDriverResponse: DriversModel?) -> Void) {
            Network.getDriver(viewController: viewController, parameters: nil) { (success, response) in
                if success {
                    completion(true,response)
                }else {
                    completion(false, nil)
                }
            }
        }
}

