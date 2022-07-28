//
//  PickScheduleViewController+DataSource.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import Foundation
import UIKit

extension PickScheduleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath)
        
        var cellContent = cell.defaultContentConfiguration()
        cellContent.text = "Every \(Constants.LONG_DAY[indexPath.row])"
        cell.contentConfiguration = cellContent
        cell.tintColor = UIColor.primGreen
        
        if selectedDay[indexPath.row] == 1 {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        return cell
    }
}
