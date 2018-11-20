//
//  Habit.swift
//  JustAHabit
//
//  Created by Jaeson Booker on 11/16/18.
//  Copyright © 2018 Jaeson Booker. All rights reserved.
//

import Foundation
import UIKit

struct Habit: Codable {
    let dataCreated: Date = Date()
    
    var title: String
    var selectedImage: Habit.Images
    var currentStreak: Int = 0
    var bestStreak: Int = 0
    var lastCompletionDate: Date?
    var numberOfCompletions: Int = 0
    
    var hasCompletedForToday: Bool {
        return lastCompletionDate?.isToday ?? false
    }
    
    enum Images: Int, CaseIterable, Codable {
        case book
        case murder
        case treason
        case pedestrianCrushing
        case eatingDust
        case eatingCorpses
        case napping
        case becomingOneWithTheUniverse
        case lickingShrimp
        case readingTheIngredientsAtTheSuperMarket
        case namingKidsJoe
        var image: UIImage {
            guard let image = UIImage(named: String(describing: self)) else {
                fatalError("image \(self) not found")
            }
//        var image: UIImage {
//            guard let image = UIImage(named: "dayofDead.jpg") else {
//                fatalError("image \(self) not found, m8, keep lookin")
//            }
            return image
        }
    }
    //image: UIImage)
    init(title: String, image: Habit.Images) {
        self.title = title
        self.selectedImage = image
    }
}
