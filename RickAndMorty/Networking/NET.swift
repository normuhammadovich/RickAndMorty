//
//  NET.swift
//  RickAndMorty
//
//  Created by Chingiz Jumanov on 25/12/22.
//

import Alamofire
import SwiftyJSON
import UIKit

class NET {
    
    static func simpleRequest(to url: String, method: HTTPMethod, withLoader: Bool = true, completion: @escaping ([CharacterDM]?)->Void) {
        
        if Reachability.isConnectedToNetwork() {
            if withLoader {
                Loader.start()
            }
        }
        
        let request = AF.request(url, method: .get, encoding: JSONEncoding.default)
        
        request.responseData { response in
            
            if withLoader {
                Loader.stop()
            }
            switch response.result {
            case .success(let data):
                let jsonData = JSON(data)
                if let subData = jsonData["results"].array {
                    completion(subData.map{ CharacterDM(json: $0)})
                }
                
            case .failure(let error):
                print("error", error.localizedDescription)
            }
        }
    }
    
    static func getCharRequest(to url: String, method: HTTPMethod, withLoader: Bool = true, completion: @escaping (CharacterDM?)->Void) {
        if Reachability.isConnectedToNetwork() {
            if withLoader {
                Loader.start()
            }
        }
        
        let request = AF.request(url, method: .get, encoding: JSONEncoding.default)
        
        request.responseData { response in
            
            if withLoader {
                Loader.stop()
            }
            switch response.result {
            case .success(let data):
                let jsonData = JSON(data)
                completion(CharacterDM(json: jsonData))
                
            case .failure(let error):
                print("error", error.localizedDescription)
            }
        }
    }
    
    static func getEpisodeRequest(to url: String, method: HTTPMethod, withLoader: Bool = true, completion: @escaping (EpisodeDM?)->Void) {
        if Reachability.isConnectedToNetwork() {
            if withLoader {
                Loader.start()
            }
        }
        
        let request = AF.request(url, method: .get, encoding: JSONEncoding.default)
        
        request.responseData { response in
            
            if withLoader {
                Loader.stop()
            }
            switch response.result {
            case .success(let data):
                let jsonData = JSON(data)
                completion(EpisodeDM(json: jsonData))
                
            case .failure(let error):
                print("error", error.localizedDescription)
            }
        }
    }
}
