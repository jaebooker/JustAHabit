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
    
    private func saveHabits() {
        guard let habitsData = try? JSONEncoder().encode(self.habits) else {
            fatalError("failed to encode list of habits")
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(habitsData, forKey: PersistenceLayer.userDefaultsHabitKeyValue)
    }
    
    private mutating func loadHabits() {
        let userDefaults = UserDefaults.standard
        guard let habitData = userDefaults.data(forKey: PersistenceLayer.userDefaultsHabitKeyValue),
            let habits = try? JSONDecoder().decode([Habit].self, from: habitData) else {
                return
        }
        self.habits = habits
    }
    mutating func markHabitAsCompleted(_ habitIndex: Int) -> Habit {
        var updatedHabit = self.habits[habitIndex]
        guard updatedHabit.hasCompletedForToday == false else { return updatedHabit }
        updatedHabit.numberOfCompletions += 1
        if let lastCompletionDate = updatedHabit.lastCompletionDate, lastCompletionDate.isYesterday {
            updatedHabit.currentStreak += 1
        } else {
            updatedHabit.currentStreak = 1
        }
        if updatedHabit.currentStreak > updatedHabit.bestStreak {
            updatedHabit.bestStreak = updatedHabit.currentStreak
        }
        let now = Date()
        updatedHabit.lastCompletionDate = now
        self.habits[habitIndex] = updatedHabit
        self.saveHabits()
        return updatedHabit
    }
    private mutating func deleteHabit( _habitIndex: Int) {
        self.habits.remove(at: _habitIndex)
        self.saveHabits() //persist changes made
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
