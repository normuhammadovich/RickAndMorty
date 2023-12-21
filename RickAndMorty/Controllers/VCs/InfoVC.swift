//
//  InfoVC.swift
//  RickAndMorty
//
//  Created by Chingiz Jumanov on 25/12/22.
//

import UIKit
import SDWebImage

class InfoVC: UIViewController {
    
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var indicatorView: UIView!
    
    @IBOutlet weak var statusAndSpeciesLbl: UILabel!
    
    @IBOutlet weak var genderLbl: UILabel!
    
    @IBOutlet weak var originLbl: UILabel!
    
    @IBOutlet weak var locationLbl: UILabel!
    
    @IBOutlet weak var allViews: UIView!
    
    var url = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getInfo()
        allViews.isHidden = true
        navigationItem.hidesBackButton = true
        setUpNavigationBar()
    }
    func setUpNavigationBar() {

        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
}


//MARK: - Get Character Info with API
extension InfoVC {
    
    func getInfo() {
        API.getCharInfo(to: url) { [self] data in
            guard let character = data else { return }
            
            switch character.status {
            case "Alive":
                indicatorView.backgroundColor = .systemGreen
            case "Dead":
                indicatorView.backgroundColor = .systemRed
            case "unknown":
                indicatorView.backgroundColor = .systemGray4
            case .some(_):
                indicatorView.backgroundColor = .white
            case .none:
                indicatorView.backgroundColor = .white
            }
            
            nameLbl.text = character.name
            self.navigationItem.title = "\(character.name ?? "")"
            statusAndSpeciesLbl.text = "\(character.status?.capitalized ?? "") - \(character.species?.capitalized ?? "")"
            genderLbl.text = character.gender
            originLbl.text = character.location?.name
            locationLbl.text = character.origin?.name
            
            img.sd_imageIndicator = SDWebImageActivityIndicator.white
            img.sd_setImage(with: URL(string: character.image ?? ""))
            allViews.isHidden = false
            navigationItem.hidesBackButton = false
            Loader.stop()
            
        }
    }
    
}
