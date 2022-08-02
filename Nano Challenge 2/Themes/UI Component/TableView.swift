//
//  TableView.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 26/07/22.
//

import Foundation
import UIKit

class CustomTableView: UITableView {
    required init(isScrollable: Bool, style: UITableView.Style) {
        super.init(frame: .zero, style: style)
        
        if style == .plain {
            self.separatorStyle = .none
            self.backgroundColor = .clear
            self.alwaysBounceVertical = isScrollable
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
