//
//  AddGoalDelegate.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 28/07/22.
//

import Foundation

protocol AddGoalDelegate {
    func validateField()
}

protocol GoalAddedDelegate {
    func reloadGoals()
}
