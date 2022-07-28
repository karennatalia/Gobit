//
//  HabitCoreDataSource.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 28/07/22.
//

import Foundation
import CoreData

struct HabitCoreDataSource: HabitRepositoryDataStore {
    
    private let context = CoreDataManager.shared.context
    
    func showAll() -> [Habit] {
        let habitRequest: NSFetchRequest = Habit.fetchRequest()
        
        guard let habits = try? context.fetch(habitRequest)
        else {
            return []
        }
        
        return habits
    }
    
    func add(title: String, schedule: [Int], desc: String, goal: Goal) {
        let newHabit = Habit(context: context)
        newHabit.title = title
        newHabit.startDate = Date()
        newHabit.numOfDone = 0
        newHabit.numOfMissed = 0
        newHabit.desc = desc
        newHabit.statusToday = false
        newHabit.goal = goal
        
        do {
          newHabit.schedule = try NSKeyedArchiver.archivedData(withRootObject: schedule, requiringSecureCoding: true)
        } catch {
          print("failed to archive array with error: \(error)")
        }
        
        do {
            try context.save()
        } catch {
            print("Failed to add new habit!")
        }
    }
    
    func update(item: Habit, newTitle: String, newDesc: String, schedule: [Int]) {
        item.title = newTitle
        item.desc = newDesc
        
        do {
          item.schedule = try NSKeyedArchiver.archivedData(withRootObject: schedule, requiringSecureCoding: true)
        } catch {
          print("failed to archive array with error: \(error)")
        }

        do {
            try context.save()
        } catch {
            print("Failed to update habit!")
        }
    }
    
    func updateGamification(item: Habit, newNumOfDone: Int, newNumOfMissed: Int, newStreak: Int, newHealth: Int, newExp: Int, newLevel: Int) {
        item.numOfDone = Int64(newNumOfDone)
        item.numOfMissed = Int64(newNumOfMissed)
        item.streak = Int16(newStreak)
        item.goal?.health = Int16(newHealth)
        item.goal?.exp = Int16(newExp)
        item.goal?.level = Int16(newLevel)
        item.statusToday = false
        
        do {
            try context.save()
        } catch {
            print("Failed to update habit!")
        }
    }
    
    func updateStatus(item: Habit, statusToday: Bool) {
        item.statusToday = statusToday
        
        do {
            try context.save()
        } catch {
            print("Failed to update habit!")
        }
    }

    func delete(item: Habit) {
        context.delete(item)

        do {
            try context.save()
        } catch {
            print("Failed to delete habit!")
        }
    }
    
    func showHabit(at weekday: Int) -> [Habit] { // 1 = sunday, 7 = saturday
        let habitRequest: NSFetchRequest = Habit.fetchRequest()
        var todayHabit:[Habit] = []
        
        guard let habits = try? context.fetch(habitRequest)
        else {
            return []
        }
        
        for habit in habits {
            let schedule = binaryToArray(scheduleData: habit.schedule)
            if schedule[weekday - 1] == 1 {
                todayHabit.append(habit)
            }
        }
        
        return todayHabit
    }
}
