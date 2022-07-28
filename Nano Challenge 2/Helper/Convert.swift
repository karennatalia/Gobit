//
//  Convert.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 28/07/22.
//

import Foundation

func binaryToArray(scheduleData: Data?) -> [Int] {
    if let schedule = scheduleData {
        do {
            if let scheduleArr = try NSKeyedUnarchiver.unarchivedObject(ofClass: NSArray.self, from: schedule) as? [Int] {
                dump(scheduleArr)
                return scheduleArr
            }
        } catch {
            print("could not unarchive array: \(error)")
        }
    }
    return []
}

func dateToString(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .long
    return dateFormatter.string(from: date)
}

func pickedDayString(selectedDay: [Int]) -> String {
    var dayString = ""
    var isFirst = true
    var count = 0
    
    if selectedDay[0] == 1 {
        dayString = "Sun"
        isFirst = false
        count += 1
    }
    if selectedDay[1] == 1 {
        if isFirst == true {
            dayString = "Mon"
            isFirst = false
        }
        else {
            dayString = "\(dayString), Mon"
        }
        count += 1
    }
    if selectedDay[2] == 1 {
        if isFirst == true {
            dayString = "Tue"
            isFirst = false
        }
        else {
            dayString = "\(dayString), Tue"
        }
        count += 1
    }
    if selectedDay[3] == 1 {
        if isFirst == true {
            dayString = "Wed"
            isFirst = false
        }
        else {
            dayString = "\(dayString), Wed"
        }
        count += 1
    }
    if selectedDay[4] == 1 {
        if isFirst == true {
            dayString = "Thu"
            isFirst = false
        }
        else {
            dayString = "\(dayString), Thu"
        }
        count += 1
    }
    if selectedDay[5] == 1 {
        if isFirst == true {
            dayString = "Fri"
            isFirst = false
        }
        else {
            dayString = "\(dayString), Fri"
        }
        count += 1
    }
    if selectedDay[6] == 1 {
        if isFirst == true {
            dayString = "Sat"
            isFirst = false
        }
        else {
            dayString = "\(dayString), Sat"
        }
        count += 1
    }
    
    if count == 7 {
        return "Everyday"
    }
    return dayString
}
