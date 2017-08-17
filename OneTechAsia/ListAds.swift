//
//  ListAds.swift
//  OneTechAsia
//
//  Created by Rea Won Kim on 8/17/17.
//  Copyright © 2017 Rea Won Kim. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class ListAds : Object {
    var status_code : Int!
    dynamic var message : String!
    
    var ads = List<Ads>()
    dynamic var id : String = "1"
    init(code: Int, message: String, ads : List<Ads>) {
        super.init()
        self.status_code = code
        self.message = message
        self.ads = ads
    }
    
    required init() {
        super.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        fatalError("init(value:schema:) has not been implemented")
    }
}
