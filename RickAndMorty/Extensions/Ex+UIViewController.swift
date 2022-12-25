//
//  Ex+UIViewController.swift
//  RickAndMorty
//
//  Created by Chingiz Jumanov on 25/12/22.
//

import UIKit

extension UIViewController {
    
    ///Show error alert
    func showErrorAlert(title: String?, message: String?, completion: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .destructive) { (action) in
            
            if let _ = completion {
                completion!()
                
            }
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    ///View without using Nib
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        
        return instantiateFromNib()
    }
}


