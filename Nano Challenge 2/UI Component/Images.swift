//
//  Images.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 26/07/22.
//

import Foundation
import UIKit

class CustomImage: UIImageView {
    required init(imageName: String) {
        super.init(frame: .zero)
        
        self.image = UIImage(systemName: imageName)
        self.contentMode = .scaleAspectFit
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

