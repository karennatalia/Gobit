//
//  Habit+CoreDataProperties.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 29/07/22.
//
//

import Foundation
import CoreData


extension Habit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Habit> {
        return NSFetchRequest<Habit>(entityName: "Habit")
    }

    @NSManaged public var desc: String?
    @NSManaged public var numOfDone: Int64
    @NSManaged public var numOfMissed: Int64
    @NSManaged public var schedule: Data?
    @NSManaged public var startDate: Date?
    @NSManaged public var statusToday: Bool
    @NSManaged public var title: String?
    @NSManaged public var streak: Int16
    @NSManaged public var goal: Goal?

}

extension Habit : Identifiable {

}
