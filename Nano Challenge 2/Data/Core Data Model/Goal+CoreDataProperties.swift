//
//  Goal+CoreDataProperties.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 29/07/22.
//
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var desc: String?
    @NSManaged public var exp: Int16
    @NSManaged public var health: Int16
    @NSManaged public var level: Int16
    @NSManaged public var startDate: Date?
    @NSManaged public var title: String?
    @NSManaged public var why: String?
    @NSManaged public var habits: NSSet?

}

// MARK: Generated accessors for habits
extension Goal {

    @objc(addHabitsObject:)
    @NSManaged public func addToHabits(_ value: Habit)

    @objc(removeHabitsObject:)
    @NSManaged public func removeFromHabits(_ value: Habit)

    @objc(addHabits:)
    @NSManaged public func addToHabits(_ values: NSSet)

    @objc(removeHabits:)
    @NSManaged public func removeFromHabits(_ values: NSSet)

}

extension Goal : Identifiable {

}
