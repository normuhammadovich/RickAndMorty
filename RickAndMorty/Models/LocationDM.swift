//
//  LocationDM.swift
//  RickAndMorty
//
//  Created by Chingiz Jumanov on 26/12/22.
//

import SwiftyJSON

class LocationDM {
    
    var name: String?
    var url: String?
    
    init() {
        
        self.name = nil
        self.url = nil
        
    }
    
    init(json: JSON) {
        
        self.name = json["name"].stringValue
        self.url = json["url"].stringValue
        
    }

}
