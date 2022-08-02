//
//  FilledButton.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 02/08/22.
//

import Foundation
import UIKit

class CustomFilledButton: UIButton {
    required init(title: String) {
        super.init(frame: .zero)
        
        self.layer.cornerRadius = 8
        self.backgroundColor = UIColor.secGreen
        self.tintColor = .white
        
        self.setTitleColor(.white, for: .normal)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        
        self.setImage(UIImage(systemName: "checkmark"), for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeButtonStatus(status: Bool) {
        if status == true {
            backgroundColor = .clear
            tintColor = .black
            
            setTitleColor(.black, for: .normal)
            setTitle("Completed", for: .normal)
            
            setImage(.none, for: .normal)
            
            layer.borderWidth = 1.5
            layer.borderColor = UIColor.secGreen.cgColor
        }
        else {
            backgroundColor = UIColor.secGreen
            tintColor = .white
            
            setTitleColor(.white, for: .normal)
            setTitle("Done", for: .normal)
            
            setImage(UIImage(systemName: "checkmark"), for: .normal)
            
            layer.borderWidth = 0
        }
    }
}
