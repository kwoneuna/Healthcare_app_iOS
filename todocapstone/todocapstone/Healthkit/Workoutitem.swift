//
//  Workoutitem.swift
//  todocapstone
//
//  Created by hufsaim on 2023/05/21.
//

import Foundation

class WorkoutItems : ObservableObject {
    @Published var workoutItems : [Workout] = []
}
