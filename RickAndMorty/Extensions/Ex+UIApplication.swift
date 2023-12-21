//
//  Ex+UIApplication.swift
//  RickAndMorty
//
//  Created by Chingiz Jumanov on 25/12/22.
//
import UIKit

extension UIApplication {
    static var keyWindow: UIWindow? {
        return shared.windows.first(where: {$0.isKeyWindow})
    }
}
