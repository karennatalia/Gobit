//
//  Labels.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 25/07/22.
//

import Foundation
import UIKit

class CustomLabel: UILabel {
    required init(text: String, style: UIFont, alignment: NSTextAlignment, color: UIColor) {
        super.init(frame: .zero)
        
        self.text = text
        self.font = style
        self.textColor = color
        self.textAlignment = alignment
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
