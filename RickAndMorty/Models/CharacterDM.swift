//
//  CharacterDM.swift
//  RickAndMorty
//
//  Created by Chingiz Jumanov on 25/12/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class CharacterDM {
    
    var name: String?
    var status: String?
    var species: String?
    var type: String?
    var gender: String?
    var episode: [EpisodeDM]?
    var location: LocationDM?
    var image: String?
    var url: String?
    
    init() {
        
        self.name = nil
        self.status = nil
        self.species = nil
        self.type = nil
        self.gender = nil
        self.episode = nil
        self.location = nil
        self.image = nil
        self.url = nil
        
    }
    
    init(json: JSON) {
        
        self.name = json["name"].stringValue
        self.status = json["status"].stringValue
        self.species = json["species"].stringValue
        self.type = json["type"].stringValue
        self.gender = json["gender"].stringValue
        self.episode = json["episode"].arrayValue.map{ EpisodeDM(json: $0 )}
        self.location = LocationDM(json: JSON(json["location"]))
        self.image = json["image"].stringValue
        self.url = json["url"].stringValue
        
    }
    
}

class EpisodeDM {
    
    var url: String?
    var name: String?
    
    init() {
        self.url = nil
        
    }
    
    init(json: JSON) {
        
        self.url = json.stringValue
    }

}

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
