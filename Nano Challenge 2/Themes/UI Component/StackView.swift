//
//  StackView.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import Foundation
import UIKit

func createStackViewHorizontal() -> UIStackView {
    let sv = UIStackView()
    sv.axis = .horizontal
    sv.alignment = .center
    sv.distribution = .equalSpacing
    sv.spacing = 8
    return sv
}

func createStackViewVertical() -> UIStackView {
    let sv = UIStackView()
    sv.axis = .vertical
    sv.spacing = 0
    return sv
}
