//
//  HabitDetailViewController+Delegate.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import Foundation
import UIKit

extension HabitDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 60
        case 1:
            return 80
        case 2:
            if indexPath.row == 2 {
                return 40*8
            }
            else {
                return 40
            }
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}

extension HabitDetailViewController: HabitAddedDelegate {
    func updateHabit() {
        habitDetailView?.setupUIContent()
    }
}

extension HabitDetailViewController: UICollectionViewDelegate {
    
}
