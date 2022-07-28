//
//  PickScheduleViewController+Delegate.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import Foundation
import UIKit

extension PickScheduleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedDay[indexPath.row] == 1 {
            selectedDay[indexPath.row] = 0
        }
        else {
            selectedDay[indexPath.row] = 1
        }
        tableView.reloadRows(at: [indexPath], with: .none)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}
