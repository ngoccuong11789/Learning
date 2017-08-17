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
import RealmSwift
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
                                var status_code = Int()
                                if let msg = response.value(forKey: "message") as? String {
                                    message = msg
                                }
                    if let code = response.value(forKey: "status_code") as? Int {
                        status_code = code
                    }
                    var listAd = List<Ads>()
                    if let ads = response.value(forKey: "ads") as? [NSDictionary] {
                        for ad in ads {
                            let click_url = (ad["click_url"] as? String) ?? "empty"
                            let impression_count_url = (ad["impression_count_url"] as? String) ?? "empty"
                            let short_text = (ad["short_text"] as? String) ?? "empty"
                            let long_text = (ad["long_text"] as? String) ?? "empty"
                            let promotion_url = (ad["promotion_url"] as? String) ?? "empty"
                            let promotion_name = (ad["promotion_name"] as? String) ?? "empty"
                            let action_button_text = (ad["action_button_text"] as? String) ?? "empty"
                            let newAds = Ads(click_url: click_url, impression_count_url: impression_count_url, short_text: short_text, long_text: long_text, promotion_url: promotion_url, promotion_name: promotion_name, action_button_text: action_button_text)
                            
                            listAd.append(newAds)
                        }

                    }
                                
                    let listAds = ListAds(code: status_code, message: message, ads: listAd)
                    success(listAds)
                case .failure(let error):
                    print(error)
                    failure(error)
                }
        }
    }
    
    //


}
