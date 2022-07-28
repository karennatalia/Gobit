//
//  UILabel+Ext.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import Foundation
import UIKit

extension UILabel {
    func setGreenCircle(width: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = width/2
        backgroundColor = UIColor.secGreen
    }
    
    func setOutlineCircle(width: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = width/2
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func addLeftIcon(imageName: String, text: String) {
        let iconAttachment = NSTextAttachment()

        iconAttachment.image = UIImage(systemName: imageName)?.withRenderingMode(.alwaysTemplate)
        let stringWithIcon = NSMutableAttributedString(string: "")
        stringWithIcon.append(NSAttributedString(attachment: iconAttachment))
        stringWithIcon.append(NSMutableAttributedString(string: " \(text)"))
        
        attributedText = stringWithIcon
    }
}
