//
//  MainVC.swift
//  RickAndMorty
//
//  Created by Chingiz Jumanov on 25/12/22.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var characters: [CharacterDM] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        getChars()
    
    }
    
    func setUpTableView() {
        navigationItem.title = "Rick and Morty"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CharacterInfoTVC.nib(), forCellReuseIdentifier: CharacterInfoTVC.identifier)
    }
}


//MARK: - UITableViewDelegate
extension MainVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = InfoVC.loadFromNib()
        vc.url = characters[indexPath.row].url ?? ""
        Loader.start()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
//MARK: - UITableViewDataSource
extension MainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterInfoTVC.identifier, for: indexPath) as? CharacterInfoTVC else { return UITableViewCell() }
        
        cell.updateCell(character: characters[indexPath.row])
        
        return cell
        
    }
    
}

//MARK: - Get Characters with API
extension MainVC {
    
    func getChars() {
        API.getCharacters { [self] data in
            guard let data = data else { return }
            characters = data
            tableView.reloadData()
        }
    }
    
    
}
