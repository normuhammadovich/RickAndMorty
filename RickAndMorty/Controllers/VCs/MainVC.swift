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
    
    var currentPage = 1
    var isLastPage = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        getChars(page: currentPage)
    
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            if !isLastPage && indexPath.row == characters.count - 1 {
                currentPage += 1
                getChars(page: currentPage)
            }
        }
    
}

//MARK: - Get Characters with API
extension MainVC {
    
    func getChars(page: Int) {
        API.getCharacters(page: page) { [self] data in
            guard let data = data else { return }
            
            if page == 1 {
                self.characters = data
            } else {
                self.characters += data
            }
            
            if data.count < 20 {
                self.isLastPage = true
            }

            tableView.reloadData()
        }
    }
    
    
}
