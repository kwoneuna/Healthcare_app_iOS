//
//  UserInfo.swift
//  capstone_immune
//
//  Created by 박민정 on 2023/05/30.
//

import Foundation
import SwiftUI

class UserInfo: ObservableObject {
    @Published var isLoading = true
    @Published var isEnteringPersonalInfo = false
    @Published var name = ""
    @Published var regionindex : Int = 0
    @Published var agerangeindex : Int = 0
    @Published var genderindex : Int = 0
    @Published var temperature : Int = 0
    @Published var fatigue: Double = 0.0
    @ObservedObject var stress = Stress()
    @ObservedObject var sleep = SleepView()
    
    func total() -> Int {
        let sum = stress.calculateTotal() + sleep.calculateTotal()
        return sum
    }
    // 면역력 계산 로직
    var immunityLevel: String{
        //나이대 점수변환 과정
        var agevalue = 0
        
        if agerangeindex == 0{
            agevalue = 28
        } else if agerangeindex == 1{
            agevalue = 33
        } else if agerangeindex == 2{
            agevalue = 28
        } else if agerangeindex == 3{
            agevalue = 23
        } else if agerangeindex == 4{
            agevalue = 18
        } else if agerangeindex == 5{
            agevalue = 13
        } else if agerangeindex == 6{
            agevalue = 9
        } else{
            agevalue = 3
        }
        
        var temperaturevalue = 0
        var difference = 0
        var score = 0
        
        if temperature >= 18 && temperature <= 24{
            temperaturevalue = 33
        }else if temperature > 24{
            difference = abs(temperature - 24)
            score = 33 - (difference * 5)
            temperaturevalue = max(score,0)
        }else{
            difference = abs(temperature - 18)
            score = 33-(difference * 5)
            temperaturevalue = max(score,0)
        }
        
        //피로도
        var fatiguevalue = 0
        fatiguevalue = Int(fatigue * 0.34)
        
        //총 점수 계산
        var total = 0
        total = agevalue + temperaturevalue + fatiguevalue
        
        if total >= 0 && total <= 30{
            return "Weak"
        }else if total > 30 && total <= 70{
            return "Moderate"
        }else{
            return "Strong"
        }
    }
    
    //loading 시간 지연시키는것
    init() {
        // Simulating loading delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLoading = false
            self.isEnteringPersonalInfo = true
        }
    }
}
