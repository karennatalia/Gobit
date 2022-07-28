//
//  Labels.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 25/07/22.
//

import Foundation
import UIKit

func createBlackRegularLabel(text: String, size: CGFloat, alignment: NSTextAlignment) -> UILabel {
    let label = UILabel()
    label.text = text
    label.font = UIFont.systemFont(ofSize: size, weight: .regular)
    label.textColor = UIColor.black
    label.textAlignment = alignment
    return label
}

func createBlackSemiboldLabel(text: String, size: CGFloat, alignment: NSTextAlignment) -> UILabel {
    let label = UILabel()
    label.text = text
    label.font = UIFont.systemFont(ofSize: size, weight: .semibold)
    label.textColor = UIColor.black
    label.textAlignment = alignment
    return label
}

func createGreyRegularLabel(text: String, size: CGFloat, alignment: NSTextAlignment) -> UILabel {
    let label = UILabel()
    label.text = text
    label.font = UIFont.systemFont(ofSize: size, weight: .regular)
    label.textColor = UIColor.lightGray
    label.textAlignment = alignment
    return label
}

func createGreySemiboldLabel(text: String, size: CGFloat, alignment: NSTextAlignment) -> UILabel {
    let label = UILabel()
    label.text = text
    label.font = UIFont.systemFont(ofSize: size, weight: .semibold)
    label.textColor = UIColor.lightGray
    label.textAlignment = alignment
    return label
}

func createGreenRegularLabel(text: String, size: CGFloat, alignment: NSTextAlignment) -> UILabel {
    let label = UILabel()
    label.text = text
    label.font = UIFont.systemFont(ofSize: size, weight: .regular)
    label.textColor = UIColor.primGreen
    label.textAlignment = alignment
    return label
}

func createGreenSemiboldLabel(text: String, size: CGFloat, alignment: NSTextAlignment) -> UILabel {
    let label = UILabel()
    label.text = text
    label.font = UIFont.systemFont(ofSize: size, weight: .semibold)
    label.textColor = UIColor.primGreen
    label.textAlignment = alignment
    return label
}
