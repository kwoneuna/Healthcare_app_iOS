//
//  Workout.swift
//  todocapstone
//
//  Created by hufsaim on 2023/05/21.
//

import Foundation

struct Workout: Codable,Hashable, Identifiable {
    var id : Int
    var name: String
    var imageName : String
    var duration : String
    var distance : Int
    var calories : Int
}
