//
//  HomeViewController.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 25/07/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeView: HomeView?
    
    let habitRepo = HabitRepository.shared
    var todayHabitList: [Habit]?
    let userDefaults = UserDefaults.standard
    var weekday: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.delegate = self
    }
    
    override func loadView() {
        super.loadView()
        
        weekday = Calendar.current.component(.weekday, from: Date()) // 1 = sunday, 7 = saturday
        
        todayHabitList = habitRepo.showHabit(at: weekday!)
        homeView?.toDoTable.reloadData()
        
        homeView = HomeView(vc: self)
        self.view = homeView
        setupDayTitle(weekday: weekday!)
        checkNewDay()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        todayHabitList = habitRepo.showHabit(at: weekday!)
        homeView?.updateTableViewConstraint()
        homeView?.toDoTable.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    func setupDayTitle(weekday: Int) {
        navigationItem.title = "It's \(Constants.LONG_DAY[weekday - 1])!"
    }
    
    func checkNewDay() {
        let checkSaved = userDefaults.bool(forKey: "savedDate")
        let currWeekday = Calendar.current.component(.weekday, from: Date())
        if checkSaved == false {
            userDefaults.set(currWeekday, forKey: "savedDate")
        }
        else {
            let savedWeekday = userDefaults.object(forKey: "savedDate") as! Int
            if savedWeekday != currWeekday {
                userDefaults.set(currWeekday, forKey: "savedDate")
                // new day, count point here
                countAndUpdateGame(weekday: savedWeekday)
            }
        }
    }
    
    func countAndUpdateGame(weekday: Int) {
        var totalPoint = 0
        let habits = habitRepo.showHabit(at: weekday)
        
        var doneNumber = 0
        var missedNumber = 0
        var streakNumber = 0
        var healthNumber = 0
        var expNumber = 0
        var levelNumber = 0
        var maxExp = 0
        
        var allDoneNumber = 0
        var allMissedNumber = 0
        var allIncreaseExp = 0
        var isLevelUp = false
        var allhealthRestored = 0
        
        for habit in habits {
            totalPoint = 0
            doneNumber = Int(habit.numOfDone)
            missedNumber = Int(habit.numOfMissed)
            streakNumber = Int(habit.streak)
            healthNumber = Int(habit.goal?.health ?? 0)
            expNumber = Int(habit.goal?.exp ?? 0)
            levelNumber = Int(habit.goal?.level ?? 0)
            if levelNumber == 1 {
                maxExp = 7 * Int(habit.goal?.habits?.count ?? 0)
            }
            else if levelNumber == 2 {
                maxExp = 30 * Int(habit.goal?.habits?.count ?? 0)
            }
            else if levelNumber == 3 {
                maxExp = 60 * Int(habit.goal?.habits?.count ?? 0)
            }
            
            switch habit.statusToday {
            case true:  // did the habit
                print("did the habit")
                doneNumber += 1
                allDoneNumber += 1
                streakNumber += 1
                if streakNumber >= 10 {
                    totalPoint += 5
                    allIncreaseExp += 5
                }
                else if streakNumber >= 5 {
                    totalPoint += 3
                    allIncreaseExp += 3
                    if streakNumber % 5 == 0 { // did habit kelipatan 5 = tambah 1 health
                        if healthNumber < 5 {
                            healthNumber += 1
                            allhealthRestored += 1
                        }
                    }
                }
                else if streakNumber < 5 {
                    totalPoint += 1
                    allIncreaseExp += 1
                }
                
                
            case false: // miss the habit
                print("miss the habit")
                if levelNumber == 1 && healthNumber == 1 {
                }
                else if healthNumber >= 1 && levelNumber > 1 {
                    healthNumber -= 1
                    allhealthRestored -= 1
                    if healthNumber == 0 && levelNumber > 1 {
                        levelNumber -= 1
                        healthNumber = 5
                    }
                }
                missedNumber += 1
                allMissedNumber += 1
                streakNumber = 0
            }
            // update each habit & their goals
            if expNumber + totalPoint <= maxExp {
                expNumber += totalPoint
                if expNumber == maxExp { // level up
                    if levelNumber < 3 {
                        levelNumber += 1
                        isLevelUp = true
                        expNumber = 0
                    }
                    else if levelNumber == 3 {
                        expNumber = maxExp
                    }
                }
            }
            else {
                let temp = maxExp - expNumber //added value before level up
                if levelNumber < 3 {
                    levelNumber += 1
                    expNumber = totalPoint - temp
                }
                else if levelNumber == 3 {
                    expNumber = maxExp
                }
            }
            
            habitRepo.updateGamification(item: habit, newNumOfDone: doneNumber, newNumOfMissed: missedNumber, newStreak: streakNumber, newHealth: healthNumber, newExp: expNumber, newLevel: levelNumber)
            
        }
        let message = generateAlertContent(allDoneNumber: allDoneNumber, allMissedNumber: allMissedNumber, isLevelUp: isLevelUp, allIncreasedExp: allIncreaseExp, allHealthRestored: allhealthRestored)
        self.contentAlert(title: "Yesterday's Recap!", message: message)
    }
    
    func generateAlertContent(allDoneNumber: Int, allMissedNumber: Int, isLevelUp: Bool, allIncreasedExp: Int, allHealthRestored: Int) -> String {
        var result = ""
        if allDoneNumber >= 1 {
            result = "\(result)Yay, you did \(allDoneNumber) habit yesterday!\n"
        }
        if allMissedNumber >= 1 {
            result = "\(result)Sadly, you missed to do \(allMissedNumber) habit :(\n"
        }
        if isLevelUp == true {
            result = "\(result)Good news is you got a total of \(allIncreasedExp) exp and one/more of your goal level up!\n"
        }
        if allHealthRestored >= 1 {
            result = "\(result)And you restore a total of \(allHealthRestored) hearts!"
        }
        return result
    }
}

