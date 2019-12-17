//
//  AlertHandler.swift
//  Unit7 Project Folder
//
//  Created by Joseph Heydorn on 12/11/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import UIKit
extension UIViewController {
    func presentAlert(with title: String?, message: String?, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: handler)
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}
