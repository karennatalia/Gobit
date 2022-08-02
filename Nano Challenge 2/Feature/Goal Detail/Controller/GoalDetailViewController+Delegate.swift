//
//  GoalDetailViewController+Delegate.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 27/07/22.
//

import Foundation
import UIKit

extension GoalDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = HabitDetailViewController()
        vc.selectedHabit = habitList[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            habitRepo.delete(item: habitList[indexPath.row])
            habitList = selectedGoal?.habits?.allObjects as! [Habit]
            goalDetailView?.habitTableView.reloadData()
            goalDetailView?.updateEmptyStateConstraint()
        }
    }
}

extension GoalDetailViewController: GoalAddedDelegate {
    func reloadGoals() {
        goalDetailView?.setupUIContent()
    }
}

extension GoalDetailViewController: HabitAddedDelegate {
    func updateHabit() {
        habitList = selectedGoal?.habits?.allObjects as! [Habit]
        goalDetailView?.habitTableView.reloadData()
        goalDetailView?.setupUIContent()
        goalDetailView?.updateEmptyStateConstraint()
    }
}

extension GoalDetailViewController: GoalDetailDelegate {
    func toAddHabit() {
        let addHabitVC = AddHabitViewController()
        addHabitVC.selectedGoal = selectedGoal
        addHabitVC.isEdit = false
        addHabitVC.delegateVC = self
        let nav = UINavigationController(rootViewController: addHabitVC)
        present(nav, animated: true)
    }
    
    func presentGuidelines() {
        present(GuidelinesViewController(), animated: true)
    }
}
