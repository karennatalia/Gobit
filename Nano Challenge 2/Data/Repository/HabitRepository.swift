//
//  HabitRepository.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 28/07/22.
//

import Foundation

protocol HabitRepositoryDataStore {
    func showAll() -> [Habit]
    func showHabit(at weekday: Int) -> [Habit]
    func add(title: String, schedule: [Int], desc: String, goal: Goal)
    func update(item: Habit, newTitle: String, newDesc: String, schedule: [Int])
    func updateGamification(item: Habit, newNumOfDone: Int, newNumOfMissed: Int, newStreak: Int, newHealth: Int, newExp: Int, newLevel: Int)
    func updateStatus(item: Habit, statusToday: Bool)
    func delete(item: Habit)
}

class HabitRepository: HabitRepositoryDataStore {

    private var coreData: HabitCoreDataSource
    
    private init(coreData: HabitCoreDataSource) {
        self.coreData = coreData
    }
    
    static let shared = HabitRepository(coreData: HabitCoreDataSource())
    
    func showAll() -> [Habit] {
        return coreData.showAll()
    }
    
    func add(title: String, schedule: [Int], desc: String, goal: Goal) {
        coreData.add(title: title, schedule: schedule, desc: desc, goal: goal)
    }
    
    func update(item: Habit, newTitle: String, newDesc: String, schedule: [Int]) {
        coreData.update(item: item, newTitle: newTitle, newDesc: newDesc, schedule: schedule)
    }
    
    func updateGamification(item: Habit, newNumOfDone: Int, newNumOfMissed: Int, newStreak: Int, newHealth: Int, newExp: Int, newLevel: Int) {
        coreData.updateGamification(item: item, newNumOfDone: newNumOfDone, newNumOfMissed: newNumOfMissed, newStreak: newStreak, newHealth: newHealth, newExp: newExp, newLevel: newLevel)
    }
    
    func updateStatus(item: Habit, statusToday: Bool) {
        coreData.updateStatus(item: item, statusToday: statusToday)
    }

    func delete(item: Habit) {
        coreData.delete(item: item)
    }
    
    func showHabit(at weekday: Int) -> [Habit] {
        return coreData.showHabit(at: weekday)
    }
}
