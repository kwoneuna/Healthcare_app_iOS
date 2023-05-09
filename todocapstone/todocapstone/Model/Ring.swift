//
//  SwiftUIView.swift
//  todocapstone
//
//  Created by hufsaim on 2023/05/04.
//

import SwiftUI

//mark : progress Ring Model and Sample Data
struct Ring: Identifiable{
    var id = UUID().uuidString
    var progress: CGFloat
    var value: String
    var keyIcon: String
    var KeyColor: Color
    var isTest: Bool = false
}

var ring: [Ring] = [
    Ring(progress: 72, value: "Steps", keyIcon: "figure.walk", KeyColor: Color.green),
    Ring(progress: 36, value: "Calories", keyIcon: "flame.fill", KeyColor: Color.red),
    Ring(progress: 91, value: "Sleep time", keyIcon: "😴", KeyColor: Color.purple,isTest: true)

]
