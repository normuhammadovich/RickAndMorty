//
//  EpisodeDM.swift
//  RickAndMorty
//
//  Created by Chingiz Jumanov on 26/12/22.
//

import SwiftyJSON

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
