//
//  InfoVC.swift
//  RickAndMorty
//
//  Created by Chingiz Jumanov on 25/12/22.
//

import UIKit

class InfoVC: UIViewController {
    
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getInfo()
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }

}


//MARK: - Get Character Info with API
extension InfoVC {
    
    func getInfo() {
        API.getCharInfo(to: url) { [self] data in
//            nameLbl.text = character.name
//            statusAndspeciesLbl.text = "\(character.status?.capitalized ?? "") - \(character.species?.capitalized ?? "")"
//            originLbl.text = character.location?.name
//            firstSeenLbl.text = character.location?.name
//            img.sd_imageIndicator = SDWebImageActivityIndicator.white
//            img.sd_setImage(with: URL(string: character.image ?? ""))
            
            Loader.stop()
            
        }
    }
    
}
