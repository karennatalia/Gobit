//
//  GoalRepository.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 28/07/22.
//

import Foundation

protocol GoalRepositoryDataStore {
    func showAll() -> [Goal]
    func add(title: String, desc: String, why: String)
    func update(item: Goal, newTitle: String, newDesc: String, newWhy: String)
    func delete(item: Goal)
}

class GoalRepository: GoalRepositoryDataStore {

    private var coreData: GoalCoreDataSource
    
    private init(coreData: GoalCoreDataSource) {
        self.coreData = coreData
    }
    
    static let shared = GoalRepository(coreData: GoalCoreDataSource())
    
    func showAll() -> [Goal] {
        return coreData.showAll()
    }
    
    func add(title: String, desc: String, why: String) {
        coreData.add(title: title, desc: desc, why: why)
    }
    
    func update(item: Goal, newTitle: String, newDesc: String, newWhy: String) {
        coreData.update(item: item, newTitle: newTitle, newDesc: newDesc, newWhy: newWhy)
    }

    func delete(item: Goal) {
        coreData.delete(item: item)
    }
}
