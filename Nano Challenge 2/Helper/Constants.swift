//
//  Constants.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import Foundation
import UIKit

class Constants {
    static let INITIAL_DAY = ["S", "M", "T", "W", "T", "F", "S"]
    static let SHORT_DAY = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    static let LONG_DAY = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
}

enum FontStyle {
    static let hugeText = UIFont.systemFont(ofSize: 30, weight: .semibold)
    static let header = UIFont.systemFont(ofSize: 20, weight: .semibold)
    static let systemDefaultBold = UIFont.systemFont(ofSize: 17, weight: .semibold)
    static let systemDefault = UIFont.systemFont(ofSize: 17, weight: .regular)
    static let subHeader = UIFont.systemFont(ofSize: 16, weight: .regular)
    static let subHeaderBold = UIFont.systemFont(ofSize: 16, weight: .semibold)
    static let titleBold = UIFont.systemFont(ofSize: 14, weight: .semibold)
    static let title = UIFont.systemFont(ofSize: 14, weight: .regular)
    static let detail = UIFont.systemFont(ofSize: 12, weight: .regular)
}
