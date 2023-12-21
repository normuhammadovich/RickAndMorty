//
//  API.swift
//  RickAndMorty
//
//  Created by Chingiz Jumanov on 25/12/22.
//

import Foundation
import Alamofire
import SwiftyJSON

class API {
    
    //basic url
    static let baseURL = "https://rickandmortyapi.com/api"
    
    //urls
    static let getCharacters: String = baseURL + GetURL.characters
    static let getLocations: String = baseURL + GetURL.locations
    static let getEpisodes: String = baseURL + GetURL.episodes
    
    static func getCharacters(page: Int, completion: @escaping ([CharacterDM]?)->Void) {
        
        NET.simpleRequest(to: getCharacters + "?page=\(page)", method: .get) { data in
            guard let data = data else { return }
            completion(data)
        }
        
    }
    
    static func getCharInfo(to url: String, completion: @escaping (CharacterDM?)->Void) {
        
        NET.getCharRequest(to: url, method: .get) { data in
            guard let data = data else { return }
            completion(data)
        }
        
    }
    
    static func getEpisode(to url: String, completion: @escaping (EpisodeDM?)->Void) {
        NET.getEpisodeRequest(to: url, method: .get) { data in
            guard let data = data else { return }
            completion(data)
        }
    }
    
}




extension API {
    
    enum GetURL {
        static let characters: String = "/character"
        static let locations: String = "/location"
        static let episodes: String = "/episode"
    }
}
