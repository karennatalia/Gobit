//
//  ImageButton.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 02/08/22.
//

import Foundation
import UIKit

class CustomImageButton: UIButton {
    required init(imageName: String, color: UIColor) {
        super.init(frame: .zero)
        
        self.tintColor = color
        self.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
