//
//  Network.swift
//  KukaCaseService
//
//  Created by Abdulbaki Kaplan on 12/13/19.
//  Copyright © 2019 Abdulbaki Kaplan. All rights reserved.
//

import UIKit
import Alamofire

class Network {
    
    // MARK: - init
    
    static let shared = Network()
    static let decoder = JSONDecoder()
    static var id: String = ""
    
    // MARK: - URL
    
    static let apiEndPointUrl = "https://my-json-server.typicode.com/oguzayan/kuka/"
    static let driverDetail = "driverDetail"
    static let drivers = "drivers"

    
//  MARK:GetDrivers
    
    static func getDriverDetail(viewController: UIViewController,id: String,parameters: Parameters?, completion: @escaping (_ success: Bool, DriverDataList?) -> Void) {
        
        let fullUrl = URL(string: "\(apiEndPointUrl)\(driverDetail)/" + id)
        
        self.requestWith(url: fullUrl, method: .get, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: true, encoding: JSONEncoding.default) { (response) in
            
            guard let data = response?.data else { return }
            do {
                let getDriverDetailResponse = try self.decoder.decode(DriverDataList.self, from: data)
                completion(true, getDriverDetailResponse)
            } catch let jsonError {
                print("Error serializing json.Network.getDriverDetail:", jsonError)
                completion(false, nil)
            }
        }
    }
//    MARK:GetDriverDetail
    
    static func getDriver(viewController: UIViewController,parameters: Parameters?, completion: @escaping (_ success: Bool, DriversModel?) -> Void) {
        
        let fullUrl = URL(string: "\(apiEndPointUrl)\(drivers)")
        
        self.requestWith(url: fullUrl, method: .get, parameters: parameters, viewController: viewController, showHud: true, showErrorAlerts: true, encoding: JSONEncoding.default) { (response) in
            
            guard let data = response?.data else { return }
            do {
                let getDriverResponse = try self.decoder.decode(DriversModel.self, from: data)
                completion(true, getDriverResponse)
            } catch let jsonError {
                print("Error serializing json.Network.getDrivers:", jsonError)
                completion(false, nil)
            }
        }
    }

    
    // MARK: - RequestWith T

    static func requestWith(url: URL!, method: HTTPMethod, parameters: Parameters?, viewController: UIViewController, showHud: Bool, showErrorAlerts: Bool, encoding: ParameterEncoding, completionHandler: @escaping (_ response: DataResponse<Any>?) -> Void) {
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: nil)
            .debugLog()
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                
                print(String(data: response.data!, encoding: .utf8) ?? "")
            
                
                switch response.result {
                case .success:
                    completionHandler(response)
                case .failure(let error):
                    if response.response?.statusCode == 401 {
                        print("Network.requestWith.error.Unauthorized:", error)
                        completionHandler(nil)
                    } else {
                        print("Network.requestWith.error:", error)
                        completionHandler(nil)
                    }
                }
        }
    }

    
  
    
    
}

// MARK: - extension Request

extension Request {
    public func debugLog() -> Self {
        #if DEBUG
        debugPrint("================================================================================================")
        debugPrint(self)
        debugPrint("================================================================================================")
        #endif
        return self
    }
}


