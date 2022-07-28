//
//  UIButton+Ext.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 28/07/22.
//

import Foundation
import UIKit

extension UIButton {
    func toCompletedButton() {
        layer.cornerRadius = 8
        backgroundColor = .clear
        tintColor = .black
        
        setTitleColor(.black, for: .normal)
        setTitle("Completed", for: .normal)
        titleLabel?.font = .systemFont(ofSize: 10, weight: .regular)
        
        setImage(.none, for: .normal)
        
        layer.borderWidth = 1.5
        layer.borderColor = UIColor.secGreen.cgColor
    }
    
    func toNotDoneButton() {
        layer.cornerRadius = 8
        backgroundColor = UIColor.secGreen
        tintColor = .white
        
        setTitleColor(.white, for: .normal)
        setTitle("Done", for: .normal)
        titleLabel?.font = .systemFont(ofSize: 10, weight: .medium)
        
        setImage(UIImage(systemName: "checkmark"), for: .normal)
        
        layer.borderWidth = 0
    }
}
