//
//  OnboardingTabView.swift
//  todocapstone
//
//  Created by hufsaim on 2023/05/20.
//

import SwiftUI
import HealthKit
//첫화면 구성하기
struct OnboardingTabView: View {
    
    @Binding var isFirstLaunching : Bool
    var body: some View {
        
        Button{
            isFirstLaunching.toggle()
        } label :{
            Text("시작하기")
        }
    }
}

