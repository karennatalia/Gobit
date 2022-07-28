//
//  Alert+Ext.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 28/07/22.
//

import Foundation
import UIKit

extension UIViewController {
    func contentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    func cancelConfirmationAlert() {
        let alert = UIAlertController(title: "Are you sure you want to cancel?", message: "Any changes will be deleted after cancel", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .destructive) { action in
            self.dismiss(animated: true)
        }
        let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        present(alert, animated: true)
    }
}
