//
//  CharacterInfoTVC.swift
//  RickAndMorty
//
//  Created by Chingiz Jumanov on 25/12/22.
//

import UIKit
import SDWebImage

class CharacterInfoTVC: UITableViewCell {

    static let identifier = "CharacterInfoTVC"
    
    static func nib() -> UINib {
        UINib(nibName: "CharacterInfoTVC", bundle: nil)
    }
    
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var indicatorView: UIView!
    
    @IBOutlet weak var statusAndspeciesLbl: UILabel!
    
    @IBOutlet weak var originLbl: UILabel!
    
    @IBOutlet weak var firstSeenLbl: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func updateCell(character: CharacterDM) {
        
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
        statusAndspeciesLbl.text = "\(character.status?.capitalized ?? "") - \(character.species?.capitalized ?? "")"
        originLbl.text = character.location?.name
        firstSeenLbl.text = character.location?.name
        img.sd_imageIndicator = SDWebImageActivityIndicator.white
        img.sd_setImage(with: URL(string: character.image ?? ""))
        
        
        
    }

}
