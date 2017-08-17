//
//  Ads.swift
//  OneTechAsia
//
//  Created by Rea Won Kim on 8/17/17.
//  Copyright © 2017 Rea Won Kim. All rights reserved.
//

import Foundation
import RealmSwift
import Realm
class Ads : Object {
    dynamic var click_url : String!
    dynamic var impression_count_url : String!
    dynamic var short_text : String!
    dynamic var long_text : String!
    dynamic var promotion_url : String!
    dynamic var promotion_name : String!
    dynamic var action_button_text : String!
    init(click_url: String, impression_count_url: String,short_text : String, long_text : String, promotion_url : String, promotion_name : String, action_button_text : String ) {
        super.init()
        self.click_url = click_url
        self.impression_count_url = impression_count_url
        self.short_text = short_text
        self.long_text = long_text
        self.promotion_url = promotion_url
        self.promotion_name = promotion_name
        self.action_button_text = action_button_text
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required init() {
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        fatalError("init(value:schema:) has not been implemented")
    }
}
