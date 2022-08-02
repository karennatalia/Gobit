//
//  NavBar.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 02/08/22.
//

import Foundation
import UIKit

class CustomNavBar: UIView {
    var leftButton: UIButton?
    var rightButton: UIButton?
    
    required init(leftButtonActive: Bool, rightButtonActive: Bool, leftText: String, righText: String) {
        super.init(frame: CGRect(x: UIScreen.main.bounds.width / 2, y: 0, width: UIScreen.main.bounds.width, height: 300))
        
        self.backgroundColor = .white
        self.setHeight(height: 61)
        self.setWidth(width: UIScreen.main.bounds.width)
        
        if leftButtonActive == true {
            leftButton = UIButton()
            self.addSubview(leftButton!)
            
            leftButton!.setTitle(leftText, for: .normal)
            leftButton!.setTitleColor(UIColor.primGreen, for: .normal)
            leftButton!.centerY(inView: self)
            leftButton!.anchor(left: self.leftAnchor, paddingLeft: 16)
        }
        
        if rightButtonActive == true {
            rightButton = UIButton()
            self.addSubview(rightButton!)
            
            rightButton!.setTitle(righText, for: .normal)
            rightButton!.setTitleColor(UIColor.primGreen, for: .normal)
            rightButton!.centerY(inView: self)
            rightButton!.anchor(right: self.rightAnchor, paddingRight: 16)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
