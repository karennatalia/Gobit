//
//  GoalDetailView.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 26/07/22.
//

import UIKit
 
class GoalDetailView: UIView {
    
    private lazy var goalImage: UIImageView = createImage(imageName: "face.smiling")
    private lazy var goalTitle: UILabel = CustomLabel(text: "Goal Title", style: FontStyle.header, alignment: .center, color: .black)
    private lazy var goalDesc: UITextView = CustomTextView()
    private lazy var goalWhy: UITextView = CustomTextView()
    private lazy var levelBackground: UIView = createCard()
    private lazy var levelDetailBackground: UIView = createCard()
    private lazy var levelText: UILabel = CustomLabel(text: "Level", style: FontStyle.detail, alignment: .center, color: .black)
    private lazy var levelNumber: UILabel = CustomLabel(text: "X", style: FontStyle.hugeText, alignment: .center, color: .secGreen)
    private lazy var expText: UILabel = CustomLabel(text: "Experience", style: FontStyle.detail, alignment: .left, color: .black)
    private lazy var expNumber: UILabel = CustomLabel(text: "X/X", style: FontStyle.detail, alignment: .right, color: .black)
    private lazy var healthText: UILabel = CustomLabel(text: "Health", style: FontStyle.detail, alignment: .left, color: .black)
    private lazy var tableViewTitle: UILabel = CustomLabel(text: "Habit System", style: FontStyle.header, alignment: .left, color: .black)
    lazy var habitTableView: UITableView = createTableView(isScrollable: true)
    private lazy var progressExp: UIProgressView = createProgressView()
    private lazy var heartOne: UIImageView = createImage(imageName: "heart.fill")
    private lazy var heartTwo: UIImageView = createImage(imageName: "heart.fill")
    private lazy var heartThree: UIImageView = createImage(imageName: "heart")
    private lazy var heartFour: UIImageView = createImage(imageName: "heart.fill")
    private lazy var heartFive: UIImageView = createImage(imageName: "heart.fill")
    private lazy var addHabitBtn: UIButton = CustomImageButton(imageName: "plus.circle", color: UIColor.primGreen)
    private lazy var lineTop: UIView = createHorizontalLine()
    private lazy var lineBottom: UIView = createHorizontalLine()
    private lazy var emptyState = EmptyState()
    private lazy var infoButton: UIButton = CustomImageButton(imageName: "info.circle", color: UIColor.primGreen)
    
    let vc: GoalDetailViewController?
    var goal: Goal?
    
    required init(vc: GoalDetailViewController, goal: Goal) {
        self.vc = vc
        self.goal = goal
        super.init(frame: .zero)
        
        setupUI()
        setupUIContent()
        setupConstraint()
        setupTableView()
        
        addHabitBtn.addTarget(self, action: #selector(toAddHabit), for: .touchUpInside)
        infoButton.addTarget(self, action: #selector(toGuidelines), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.addSubview(goalImage)
        self.addSubview(goalTitle)
        self.addSubview(goalDesc)
        self.addSubview(lineTop)
        self.addSubview(goalWhy)
        self.addSubview(lineBottom)
        self.addSubview(levelBackground)
        self.addSubview(levelDetailBackground)
        levelBackground.addSubview(levelText)
        levelBackground.addSubview(levelNumber)
        levelDetailBackground.addSubview(expText)
        levelDetailBackground.addSubview(expNumber)
        levelDetailBackground.addSubview(progressExp)
        levelDetailBackground.addSubview(healthText)
        levelDetailBackground.addSubview(heartOne)
        levelDetailBackground.addSubview(heartTwo)
        levelDetailBackground.addSubview(heartThree)
        levelDetailBackground.addSubview(heartFour)
        levelDetailBackground.addSubview(heartFive)
        self.addSubview(tableViewTitle)
        self.addSubview(habitTableView)
        self.addSubview(addHabitBtn)
        self.addSubview(emptyState)
        self.addSubview(infoButton)
        
        goalDesc.sizeToFit()
        goalDesc.isScrollEnabled = false
        goalDesc.textAlignment = .center
        goalDesc.backgroundColor = .clear
        goalDesc.font = UIFont.systemFont(ofSize: 12)
        
        goalWhy.sizeToFit()
        goalWhy.isScrollEnabled = false
        goalWhy.textAlignment = .center
        goalWhy.backgroundColor = .clear
        goalWhy.font = UIFont.systemFont(ofSize: 12)
    }
    
    func setupUIContent() {
        if goal?.level == 1 {
            goalImage.image = UIImage(named: "level-one")
        }
        else if goal?.level == 2 {
            goalImage.image = UIImage(named: "level-two")
        }
        else if goal?.level == 3 {
            goalImage.image = UIImage(named: "level-three")
        }
        
        goalTitle.text = goal?.title
        if goal?.desc == "" {
            goalDesc.setHeight(height: 0)
        }
        else {
            goalDesc.text = goal?.desc
        }
        goalWhy.text = "My Reason\n\(goal?.why ?? "")"
        levelNumber.text = "\(goal?.level ?? 0)"
        var maxExp = 0
        if goal!.level == 1 {
            maxExp = 7*(goal?.habits?.count ?? 0)
            expNumber.text = "\(goal?.exp ?? 0)/\(maxExp)"
        }
        else if goal!.level == 2 {
            maxExp = 30*(goal?.habits?.count ?? 0)
            expNumber.text = "\(goal?.exp ?? 0)/\(maxExp)"
        }
        else if goal!.level == 3 {
            maxExp = 60*(goal?.habits?.count ?? 0)
            expNumber.text = "\(goal?.exp ?? 0)/\(maxExp))"
        }
        
        if maxExp != 0 {
            progressExp.progress = Float(goal?.exp ?? 0)/Float(maxExp)
        }
        
        heartOne.image = UIImage(systemName: "heart.fill")
        heartOne.tintColor = UIColor.red
        heartTwo.image = UIImage(systemName: "heart")
        heartTwo.tintColor = UIColor.black
        heartThree.image = UIImage(systemName: "heart")
        heartThree.tintColor = UIColor.black
        heartFour.image = UIImage(systemName: "heart")
        heartFour.tintColor = UIColor.black
        heartFive.image = UIImage(systemName: "heart")
        heartFive.tintColor = UIColor.black
        if goal!.health >= 2 {
            heartTwo.image = UIImage(systemName: "heart.fill")
            heartTwo.tintColor = UIColor.red
            if goal!.health >= 3 {
                heartThree.image = UIImage(systemName: "heart.fill")
                heartThree.tintColor = UIColor.red
                if goal!.health >= 4 {
                    heartFour.image = UIImage(systemName: "heart.fill")
                    heartFour.tintColor = UIColor.red
                    if goal!.health == 5 {
                        heartFive.image = UIImage(systemName: "heart.fill")
                        heartFive.tintColor = UIColor.red
                    }
                }
            }
            
        }
    }
    
    func setupConstraint() {
        goalImage.centerX(inView: self)
        goalImage.anchor(top: self.safeAreaLayoutGuide.topAnchor, paddingTop: 30)
        goalImage.setDimensions(width: 100, height: 100)
        
        goalTitle.anchor(top: goalImage.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingTop: 16)
        goalTitle.centerX(inView: self)
        
        goalDesc.anchor(top: goalTitle.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingTop: 4)
        goalDesc.centerX(inView: self)
        
        lineTop.anchor(top: goalDesc.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingTop: 8, paddingLeft: 16, paddingRight: 16)
        
        goalWhy.centerX(inView: self)
        goalWhy.anchor(top: lineTop.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingTop: 4)
        
        lineBottom.anchor(top: goalWhy.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingTop: 8, paddingLeft: 16, paddingRight: 16)
        
        levelBackground.anchor(top: lineBottom.bottomAnchor, left: self.leftAnchor, paddingTop: 16, paddingLeft: 16)
        levelBackground.setDimensions(width: (UIScreen.main.bounds.width - (16*4)) / 3, height: 80)
        
        levelDetailBackground.anchor(top: lineBottom.bottomAnchor, left: levelBackground.rightAnchor ,right: self.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16)
        levelDetailBackground.setDimensions(width: ((UIScreen.main.bounds.width - (16*4)) * 2 / 3) + 16, height: 80)
        
        levelText.anchor(top: levelBackground.topAnchor, paddingTop: 12)
        levelText.centerX(inView: levelBackground)
        
        levelNumber.anchor(top: levelText.bottomAnchor, paddingTop: 6)
        levelNumber.centerX(inView: levelBackground)
        
        expText.anchor(top: levelDetailBackground.topAnchor, left: levelDetailBackground.leftAnchor, paddingTop: 12, paddingLeft: 12)
        expNumber.anchor(top: levelDetailBackground.topAnchor, right: levelDetailBackground.rightAnchor, paddingTop: 12, paddingRight: 12)
        
        progressExp.anchor(top: expText.bottomAnchor, left: levelDetailBackground.leftAnchor, right: levelDetailBackground.rightAnchor, paddingTop: 8, paddingLeft: 12, paddingRight: 12)
        
        healthText.anchor(top: progressExp.bottomAnchor, left: levelDetailBackground.leftAnchor, paddingTop: 12, paddingLeft: 12)
        
        heartOne.anchor(top: progressExp.bottomAnchor, left: healthText.rightAnchor, paddingTop: 10, paddingLeft: 10)
        heartOne.setDimensions(width: 16, height: 16)
        heartTwo.anchor(top: progressExp.bottomAnchor, left: heartOne.rightAnchor, paddingTop: 11, paddingLeft: 10)
        heartTwo.setDimensions(width: 16, height: 16)
        heartThree.anchor(top: progressExp.bottomAnchor, left: heartTwo.rightAnchor, paddingTop: 11, paddingLeft: 10)
        heartThree.setDimensions(width: 16, height: 16)
        heartFour.anchor(top: progressExp.bottomAnchor, left: heartThree.rightAnchor, paddingTop: 11, paddingLeft: 10)
        heartFour.setDimensions(width: 16, height: 16)
        heartFive.anchor(top: progressExp.bottomAnchor, left: heartFour.rightAnchor, paddingTop: 11, paddingLeft: 10)
        heartFive.setDimensions(width: 16, height: 16)
        
        tableViewTitle.anchor(top: levelBackground.bottomAnchor, left: self.leftAnchor, paddingTop: 28, paddingLeft: 16)
        
        addHabitBtn.anchor(top: levelDetailBackground.bottomAnchor, right: self.rightAnchor, paddingTop: 28, paddingRight: 20)
        addHabitBtn.setDimensions(width: 20, height: 20)
        
        habitTableView.anchor(top: tableViewTitle.bottomAnchor, left: self.leftAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, right: self.rightAnchor, paddingTop: 8)
        updateEmptyStateConstraint()
        
        infoButton.anchor(top: self.safeAreaLayoutGuide.topAnchor, right: self.rightAnchor, paddingTop: 16, paddingRight: 16)
    }
    
    func updateEmptyStateConstraint() {
        if vc?.habitList.count == 0 {
            emptyState.isHidden = false
            emptyState.anchor(top: tableViewTitle.bottomAnchor, paddingTop: 8)
            emptyState.centerX(inView: self)
            setEmptyStateContent()
            emptyState.setDimensions(width: UIScreen.main.bounds.width - 32, height: 200)
        }
        else {
            emptyState.isHidden = true
        }
    }
    
    func setupTableView() {
        habitTableView.register(HabitTableViewCell.self, forCellReuseIdentifier: "habitCell")
        habitTableView.dataSource = vc
        habitTableView.delegate = vc
    }
    
    func setEmptyStateContent() {
        emptyState.stateTitle.text = "You haven’t set any habit yet"
        emptyState.stateDesc.text = "Add a new habit by clicking the + button"
    }
    
    @objc func toAddHabit() {
        let addHabitVC = AddHabitViewController()
        addHabitVC.selectedGoal = goal
        addHabitVC.isEdit = false
        addHabitVC.delegateVC = vc
        let nav = UINavigationController(rootViewController: addHabitVC)
        vc!.present(nav, animated: true)
    }
    
    @objc func toGuidelines() {
        vc!.present(GuidelinesViewController(), animated: true)
    }
    
}
