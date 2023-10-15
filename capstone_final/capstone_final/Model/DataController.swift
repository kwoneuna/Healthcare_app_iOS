//
//  File.swift
//  capstone_final
//
//  Created by 박민정 on 2023/08/07.
//

import CoreData
import Foundation

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "Data")
    
    init(){
        container.loadPersistentStores { descriptoin, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}

//AddConditionView
import SwiftUI
import Combine
struct AddConditionView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @ObservedObject var userInfo: UserInfo
    @State private var selectedDate = Date()
    @State private var sleeptime = ""
    @State private var sleephour = ""
    @State private var stress = ""
    @State private var score_A = 0
    @State private var score_B = 0
    @State private var score_C = 0
    @State var score_total = 0
//    @ObservedObject var userInfo: UserInfo
    
    let hour = ["0-3시간","3-4시간","5-6시간","7시간 이상"]
    let percentage = ["0","30","50","70","100"]
    let time = ["11시 이전", "1시 이전", "2시 이후","4시 이후"]
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    DatePicker("날짜", selection: $selectedDate,displayedComponents: [.date])
                    Picker("잠든 시간", selection: $sleeptime){
                        ForEach(time, id: \.self){
                            Text($0)
                        }
                    }
                    Picker("총 수면 시간",selection : $sleephour){
                        ForEach(hour, id : \.self){
                            Text($0)
                        }
                    }
                } header: {
                    Text("수면 정보 입력하기")
                }
                Section{
                    Picker("스트레스 입력하기",selection: $stress){
                        ForEach(percentage,id:\.self){
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }header:{
                    Text("스트레스 정보 입력하기")
            
                }
                Section{
                    Button("Save"){
                        score_total = score_fatigue(_sleeptime: sleeptime, _sleephour: sleephour, _stress: stress)
                        userInfo.fatigue = 0.34 * Double(score_total)
                     
                        let newData = Fatigue(context: moc)
//                        let newData2 = UserInfo1(context: moc)
                        newData.id = UUID()
                        newData.dates = selectedDate
                        newData.stress = stress
                        newData.sleephour = sleephour
                        newData.sleeptime = sleeptime
                        newData.fatigue = Int16(score_fatigue(_sleeptime: sleeptime, _sleephour: sleephour, _stress: stress))
//                        newData2.fatigue = Int16(score_fatigue(_sleeptime: sleeptime, _sleephour: sleephour, _stress: stress))
                        try? moc.save()
                        dismiss()
                    

                    }
                }
            }
            
            
//            .navigationTitle("Add Condition")
            
            }
        }
    func score_fatigue(_sleeptime:String,_sleephour:String,_stress:String) -> Int{
        if sleeptime == "11시 이전"{
            score_A =  5
        }else if sleeptime == "1시 이전"{
            score_A = 10
        }else if sleeptime == "2시 이후"{
            score_A = 20
        }else if sleeptime == "4시 이후"{
            score_A = 30
        }
        if sleephour == "7시간 이상"{
            score_B =  0
        }else if sleephour == "5-6시간"{
            score_B = 15
        }else if sleephour == "3-4시간"{
            score_B = 20
        }else if sleephour == "0-3시간"{
            score_B = 35
        }
        if stress == "100"{
            score_C =  35
        }else if stress == "70"{
            score_C = 30
        }else if stress == "50"{
            score_C = 20
        }else if stress == "30"{
            score_C = 10
        }else if stress == "0"{
            score_C = 0
        }
        let sum = score_A + score_B + score_C
        return sum
    }
}


//AddExerciseView
struct AddExerciseView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var calories = 0
    @State private var type = ""
    @State private var time = 0
    @State private var min = 0
    
    let types = ["유산소", "근력운동"]
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("운동 이름을 입력하세요", text: $name)
                        .keyboardType(.default)
                    Picker("운동 종류", selection: $type){
                        ForEach(types, id: \.self){
                            Text($0)
                        }
                    }
                }
                Section{
//                    TextField("칼로리를 입력하세요", value: $calories, format: .number)
//                        .keyboardType(.default)
                    HStack {
                        TextField("칼로리를 입력하세요", value: $calories, format: .number)
                            .textFieldStyle(.plain)
                            .keyboardType(.default)
    
                        Text("kcal")
                    }
                    VStack{
                        Text("운동시간")
                            .font(.title2)
                        HStack{
                            Stepper(value: $time, in: 0...12, step:1){
                                Text("\(time) 시간")
    //                                .font(.title3)
                                    .background()
                            }
                            Stepper(value: $min, in: 0...60, step:1){
                                Text("\(min) 분")
    //                                .font(.title3)
                                    .background()
                            }
                            
                        }
                    }
//                    HStack{
//                        Stepper(value: $time, in: 0...12, step:1){
//                            Text("\(time) 시간")
////                                .font(.title3)
//                                .background()
//                        }
//
//                        Stepper(value: $min, in: 0...60, step:1){
//                            Text("\(min) 분")
////                                .font(.title3)
//                                .background()
//                        }
//
//                    }
                    .padding(.horizontal,6)
                    .padding(.bottom, 10)
                    
                }
                Section{
                    Button("저장"){
                        let newexercise = Exercisesave(context: moc)
                        newexercise.id = UUID()
                        newexercise.name = name
                        newexercise.type = type
                        newexercise.calories = Double(calories)
                        newexercise.time = Double(time)
                        
                        try? moc.save()
                        dismiss()
                    }
                }
            }
            .navigationTitle("운동 추가하기")

        }
    }
}
