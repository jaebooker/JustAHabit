//
//  PersistenceLayer.swift
//  JustAHabit
//
//  Created by Jaeson Booker on 11/20/18.
//  Copyright © 2018 Jaeson Booker. All rights reserved.
//

import Foundation
struct PersistenceLayer {
    private(set) var habits: [Habit] = []
    private static let userDefaultsHabitKeyValue = "HABITS_ARRAY"
    
    private mutating func loadHabits() {
        let userDefaults = UserDefaults.standard
        guard let habitData = userDefaults.data(forKey: PersistenceLayer.userDefaultsHabitKeyValue),
            let habits = try? JSONDecoder().decode([Habit].self, from: habitData) else {
                return
        }
        self.habits = habits
    }
    private func saveHabits() {
        guard let habitsData = try? JSONEncoder().encode(self.habits) else {
            fatalError("failed to encode list of habits")
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(habitsData, forKey: PersistenceLayer.userDefaultsHabitKeyValue)
    }
    init() {
        self.loadHabits()
    }
    @discardableResult
    mutating func createNewHabit(name: String, image: Habit.Images) -> Habit {
        let newHabit = Habit(title: name, image: image)
        self.habits.insert(newHabit, at: 0)
        self.saveHabits()
        return newHabit
    }
}
