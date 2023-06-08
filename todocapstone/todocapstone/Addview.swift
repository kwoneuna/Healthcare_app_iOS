//
//  Addview.swift
//  capstone_immune
//
//  Created by hufsaim on 2023/06/04.
//

import SwiftUI
import Combine
struct Addview: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
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
                     
                        let newData = Fatigue(context: moc)
                        newData.id = UUID()
                        newData.dates = selectedDate
                        newData.stress = stress
                        newData.sleephour = sleephour
                        newData.sleeptime = sleeptime
                        newData.fatigue = Int16(score_fatigue(_sleeptime: sleeptime, _sleephour: sleephour, _stress: stress))
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
            score_A =  30
        }else if sleeptime == "1시 이전"{
            score_A = 20
        }else if sleeptime == "2시 이후"{
            score_A = 10
        }else if sleeptime == "4시 이후"{
            score_A = 5
        }
        if sleephour == "7시간 이상"{
            score_B =  35
        }else if sleephour == "5-6시간"{
            score_B = 20
        }else if sleephour == "3-4시간"{
            score_B = 15
        }else if sleephour == "0-3시간"{
            score_B = 0
        }
        if stress == "100"{
            score_C =  0
        }else if stress == "70"{
            score_C = 10
        }else if stress == "50"{
            score_C = 20
        }else if stress == "30"{
            score_C = 30
        }else if stress == "0"{
            score_C = 35
        }
        let sum = score_A + score_B + score_C
        return sum
    }
   
    
    
        
    }




struct Addview_Previews: PreviewProvider {
    static var previews: some View {
        Addview()
    }
}
