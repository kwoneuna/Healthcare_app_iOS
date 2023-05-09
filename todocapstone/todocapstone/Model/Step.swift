//
//  Step.swift
//  todocapstone
//
//  Created by hufsaim on 2023/05/04.
//

import SwiftUI

//MARK : step bar graph model and sample data
struct Step: Identifiable{
    var id = UUID().uuidString
    var value: CGFloat
    var key: String
    var color: Color = Color("purple")
}
var steps: [Step] = [
    Step(value: 500, key: "1-4 AM", color: Color.blue),
    Step(value: 240, key: "5-8 AM",color : Color.green),
    Step(value: 350, key: "9-11 AM",color: .blue),
    Step(value: 430, key: "12-4 AM",color: Color.green),
    Step(value: 690, key: "5-8 PM", color: .blue),
    Step(value: 540, key: "9-12 PM",color: Color.green)
]
