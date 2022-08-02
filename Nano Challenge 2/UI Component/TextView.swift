//
//  TextView.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 02/08/22.
//

import Foundation
import UIKit

class CustomTextView: UITextView {
    required init() {
        super.init(frame: .zero, textContainer: .none)
        
        self.font = UIFont.systemFont(ofSize: 17)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
