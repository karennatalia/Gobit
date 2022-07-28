//
//  GoalsViewController+Delegate.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 26/07/22.
//

import Foundation
import UIKit

extension GoalsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = GoalDetailViewController()
        vc.hidesBottomBarWhenPushed = true
        vc.selectedGoal = goalList[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            goalRepo.delete(item: goalList[indexPath.row])
            goalList = goalRepo.showAll()
            goalsView?.goalsTableView.reloadData()
            goalsView?.updateEmptyStateConstraint()
        }
    }
}

extension GoalsViewController: GoalAddedDelegate {
    func reloadGoals() {
        goalList = goalRepo.showAll()
        goalsView?.goalsTableView.reloadData()
        goalsView?.updateEmptyStateConstraint()
    }
}
