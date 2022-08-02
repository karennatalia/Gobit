//
//  Card.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 26/07/22.
//

import Foundation
import UIKit

class CustomCard: UIView {
    required init() {
        super.init(frame: .zero)
        
        layer.cornerRadius = 12
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.cgColor
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
