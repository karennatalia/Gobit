//
//  GoalCoreDataSource.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 28/07/22.
//

import Foundation
import CoreData

struct GoalCoreDataSource: GoalRepositoryDataStore {
    
    private let context = CoreDataManager.shared.context
    
    func showAll() -> [Goal] {
        let goalRequest: NSFetchRequest = Goal.fetchRequest()
        
        guard let goals = try? context.fetch(goalRequest)
        else {
            return []
        }
        
        return goals
    }
    
    func add(title: String, desc: String, why: String) {
        let newGoal = Goal(context: context)
        newGoal.title = title
        newGoal.level = 1
        newGoal.exp = 0
        newGoal.health = 5
        newGoal.startDate = Date()
        newGoal.desc = desc
        newGoal.why = why
        
        do {
            try context.save()
        } catch {
            print("Failed to add new goal!")
        }
    }
    
    func update(item: Goal, newTitle: String, newDesc: String, newWhy: String) {
        item.title = newTitle
        item.desc = newDesc
        item.why = newWhy

        do {
            try context.save()
        } catch {
            print("Failed to update goal!")
        }
    }
    
    func delete(item: Goal) {
        let habits = item.habits?.allObjects as! [Habit]
        for habit in habits {
            context.delete(habit)
        }
        context.delete(item)

        do {
            try context.save()
        } catch {
            print("Failed to delete goal!")
        }
    }
}
