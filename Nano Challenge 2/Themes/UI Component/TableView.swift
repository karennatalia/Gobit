//
//  TableView.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 26/07/22.
//

import Foundation
import UIKit

func createTableView(isScrollable: Bool) -> UITableView {
    let tableView = UITableView()
    tableView.separatorStyle = .none
    tableView.alwaysBounceVertical = isScrollable
    tableView.backgroundColor = .clear
    return tableView
}

func createInsetGroupedTableView(isScrollable: Bool) -> UITableView {
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    tableView.alwaysBounceVertical = isScrollable
    return tableView
}
