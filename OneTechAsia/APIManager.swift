//
//  APIManager.swift
//  OneTechAsia
//
//  Created by Rea Won Kim on 8/17/17.
//  Copyright © 2017 Rea Won Kim. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

private let getAdsString = "/getAds.php"

class APIManager {
    static let sharedInstance = APIManager()
    private init() {}
    func getBaseUrl() -> String! {
        return "http://ad.tokyo-tsushin.com"
    }
    
    // MARK: - API Ads
    func getAds(
        _ app_id: String,
        user_agent: String,
        success:@escaping (_ listAds: ListAds) -> Void,
        failure:@escaping (_ error: Error) -> Void) {
        
        let url = getBaseUrl() + getAdsString
        let parameters = ["app_id": app_id,
                          "user_agent": user_agent,
                        ]
        let json = JSON(parameters)
        
        print(json)
        Alamofire.request(
            url,
            method: .post,
            parameters: parameters,
            encoding: JSONEncoding.default
            )
            .validate()
            .responseData { response in
            }
            .responseJSON { response in
                switch response.result {
                case .success(let JSON):
                    let response = JSON as! NSDictionary

                    print(response)
                                var message: String = ""
                                if let msg = response.value(forKey: "message") as? String {
                                    message = msg
                                }
                                let listAds = ListAds(msg: message)
                                success(listAds)
                case .failure(let error):
                    print(error)
                    failure(error)
                }
        }
    }
    
    //
    
    // MARK: - API login
//    func login(
//        _ app_id: String,
//        user_agent: String,
//        success:@escaping (_ jsonResult: JSON) -> Void,
//        failure:@escaping (_ error: NSError) -> Void) {
//        
//        let urlString = getBaseUrl() + getAdsString
//        
//        let parameters = ["app_id": app_id,
//                          "user_agent": user_agent,
//                          ]
//        let json = JSON(parameters)
//        
//        debugPrint(json)
//        
//        Alamofire.request(
//            urlString,
//            method: .post,
//            parameters: parameters,
//            encoding: JSONEncoding.default
//            )
//            .validate()
//            .responseData { response in
//            }
//            .responseJSON { response in
//                
//                switch response.result {
//                case .success :
//                    if let value = response.result.value {
//                        let json = JSON(value)
//                        debugPrint("JSON: \(json)")
//                        debugPrint(response.request)
//                        success(json)
//                    }
//                case .failure(let error):
//                    print(error)
//                    failure(error as NSError)
//                }
//        }
//    }


}
