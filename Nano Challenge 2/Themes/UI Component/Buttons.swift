//
//  Buttons.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 26/07/22.
//

import Foundation
import UIKit

func createFilledButton(title: String) -> UIButton {
    let button = UIButton()
    button.layer.cornerRadius = 8
    button.backgroundColor = UIColor.secGreen
    button.tintColor = .white
    
    button.setTitleColor(.white, for: .normal)
    button.setTitle(title, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 10, weight: .medium)
    
    button.setImage(UIImage(systemName: "checkmark"), for: .normal)
    
    return button
}

func createImageButton(imageName: String, color: UIColor) -> UIButton {
    let button = UIButton()
    button.tintColor = color
    button.setImage(UIImage(systemName: imageName), for: .normal)
    return button
}

func createTextButton(text: String) -> UIButton {
    let button = UIButton()
    button.setTitle(text, for: .normal)
    button.setTitleColor(UIColor.primGreen, for: .normal)
    return button
}
