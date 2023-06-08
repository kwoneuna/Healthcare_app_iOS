//
//  las.swift
//  todocapstone
//
//  Created by hufsaim on 2023/06/03.
//

import Foundation
import Combine
import SwiftUI

import SwiftUI

struct SleepInputView: View {
    @Binding var sleepHour: Int
    @Binding var sleepTime: Int

    var body: some View {
        VStack {
            TextField("Sleep Hour", value: $sleepHour, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Sleep Time", value: $sleepTime,formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }
}
struct StressinputView: View {
    @Binding var stressLevel: Int

    var body: some View {
        VStack {
            Stepper("Stress Level: \(stressLevel)", value: $stressLevel, in: 0...10)
                .padding()
        }
    }
}
struct MainView: View {
    @State private var sleepHour: Int = 0
    @State private var sleepTime: Int = 0
    @State private var stressLevel: Int = 0
    @State private var combineData : Int = 0
    var body: some View {
        VStack {
            
            SleepInputView(sleepHour: $sleepHour, sleepTime: $sleepTime)
            StressinputView(stressLevel: $stressLevel)
            
            Button(action: {
                // 저장 및 합치는 기능을 구현
                 
                combineData = sleepHour + sleepTime + stressLevel
                
            }) {
                Text("Save and Combine")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        Text("\(combineData)")
        }
        
        
        .padding()
    }
}
struct Main_preview : PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
