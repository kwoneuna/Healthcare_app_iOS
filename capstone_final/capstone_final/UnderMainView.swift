//
//  UnderMainView.swift
//  capstone_final
//
//  Created by 박민정 on 2023/08/07.
//

import Foundation
import SwiftUI

//ExerciseView
struct ExerciseView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors:[]) var Exercise: FetchedResults<Exercisesave>

    @State private var showingAddScreen = false

    var body: some View {
        VStack{
            ScrollView{
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 450)
                        .foregroundColor(.yellow)
                        .offset(y:-100)
                    VStack{
                        Image("exercise_check")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300)
                            .offset(y:-80)
                        Text("나의 운동 기록")
                            .offset(x:-120,y:-90)
                            .font(.title2)
                            .fontWeight(.heavy)
                        Text("건강은 운동과 함께하니까")
                            .offset(x:-95,y:-80)
                    }
                   
                }.ignoresSafeArea()
                NavigationView{
                    List{
                        ForEach(Exercise) { exercises in
                            NavigationLink{
                                Text(exercises.name ?? "입력 없음")
                            }label: {
                                VStack(alignment: .leading){
                                    Text(exercises.name ?? "입력 없음")
                                        .font(.headline)
                                    HStack{
                                        Text(exercises.type ?? "입력 없음")
                                            .foregroundColor(.secondary)
                                        VStack{
                                            Text(exercises.calories, format: .number)
                                            Text("Kcal")
                                                .foregroundColor(.secondary)
                                            
                                        }
                                    }
                                    
                                }
                            }
                        }
                        .onDelete(perform: deleteData)
                    }
                    .navigationTitle("Workout")
                    .toolbar{
                        ToolbarItem(placement: .navigationBarLeading){
                            EditButton()
                                .foregroundColor(.orange)
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button{
                                showingAddScreen.toggle()
                            } label: {
                                Label("운동 추가하기", systemImage: "plus")
                                    .foregroundColor(.orange)
                            }
                        }
                    }
                    .sheet(isPresented: $showingAddScreen){
                        AddExerciseView()
                    }
                }.offset(y:-90)
            }
        }
    }
    func deleteData(at offsets : IndexSet){
        for offset in offsets{
            let data = Exercise[offset]
            moc.delete(data)
        }
        try? moc.save()
    }
}

//ConditionView
struct ConditionEnterView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "dates", ascending: false)]) var fatigue : FetchedResults<Fatigue>
    @ObservedObject var userInfo: UserInfo
    @State private var showingAddScreen = false
    var body: some View {
            NavigationView{
                
                VStack{
                    Image("checking").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400)
                        .offset(y:-30)
                    Text("About Condition")
                        .font(.title2)
                        .offset(x:-100,y:-45)
                        .fontWeight(.heavy)
                    
                    Text("수면과 스트레스를 입력해 내 컨디션을 트래킹해요")
                        .font(.headline)
                        .offset(x:-20,y:-45)
                        .padding(.top,3)
                    ZStack{
                        Rectangle()
                        List{
                            ForEach(fatigue, id :\.self){ fatigue in
                                NavigationLink{
                                    
                                    Text("\(fatigue.fatigue)")
                                } label : {
                                    VStack(alignment: .leading) {
                                        Text(formatDate(fatigue.dates ?? Date()))
                                            .font(.headline)
                                    }
                                }
                            }
                            .onDelete(perform: deleteData)
                        }
                    }
                    
                    

                }
                .navigationTitle("Condition")
                    .toolbar{
                        ToolbarItem(placement: .navigationBarLeading) {
                            EditButton()
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button{
                                showingAddScreen.toggle()
                            } label : {
                                Label("Add Condition",systemImage: "plus")
                            }
                        }
                    }
                    .sheet(isPresented: $showingAddScreen) {
                        AddConditionView( userInfo: userInfo)
                    }
            }
        
        }

            
        
    //날짜만 보여주려고
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM월 dd일"
        return formatter.string(from: date)
    }
        func deleteData(at offsets : IndexSet){
        for offset in offsets{
            let data = fatigue[offset]
            moc.delete(data)
        }
        try? moc.save()
    }
}

//Checkview
struct checkview: View {
    
    @State var pickerSelectedItem = 0
    
    @State private var sleeptimepoint : [Int] = []
    @State private var sleephourpoint : [Int] = []
    @State private var stresspoint : [Int] = []
    @State private var fatiguepoint : [Int] = []
    
    
    @State var week: [String] = [
        "0", "1", "2", "3", "4", "5", "6"
    ]
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "dates", ascending: false)]) var fatigue : FetchedResults<Fatigue>
    var body: some View {
        
        ScrollView{
            VStack{
                //sleeptime
                
                Text("나의 컨디션 체크하기")
                    .font(.title)
                    .fontWeight(.heavy)
                Picker(selection: $pickerSelectedItem, label: Text("")) {
                    Text("SleepTime").tag(0)
                    Text("SleepHour").tag(1)
                    Text("Stress").tag(2)
                    Text("Fatigue").tag(3)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal,24)
                
                if pickerSelectedItem == 0 {
                    HStack (spacing: 20){
                        ForEach(sleeptimepoint, id :\.self){
                            sleeptime in
                            //                Text("\(sleeptime)")
                            BarView(value: sleeptime)
                        }
                    }.onAppear(perform: loadData_sleeptime)
                        .padding(.top, 24)
                        .animation(.default)
                }
                if pickerSelectedItem == 1 {
                    HStack (spacing: 20){
                        ForEach(sleephourpoint, id :\.self){
                            sleephour in
                            BarView(value: sleephour)
                        }
                    }.onAppear(perform: loadData_sleephour)
                        .padding(.top, 24)
                        .animation(.default)
                }
                if pickerSelectedItem == 2 {
                    HStack (spacing: 20){
                        ForEach(stresspoint, id :\.self){
                            stress in
                            BarView(value: stress)
                        }
                    }.onAppear(perform: loadData_stress)
                        .padding(.top, 24)
                        .animation(.default)
                }
                if pickerSelectedItem == 3 {
                    HStack (spacing: 20){
                        
                        HStack (spacing: 20){
                            ForEach(fatiguepoint, id :\.self){
                                fatigues in
                                BarView(value: fatigues)
                            }
                        }.onAppear(perform: loadData_fatigue)
                            .padding(.top, 24)
                            .animation(.default)
                        
                    }}
                
                
                VStack{
                    Text("나의 수면은 어떤가요?")
                        .fontWeight(.heavy)
                        .font(.title2)
                        .padding(.trailing,150)
                    Image("check_sleep")
                        .resizable()
                        .frame(width: 300, height:250)
                    Text("수면을 취하는 동안 신체회복, 정신적 피로도 감소, 면역 기능 강화 등이 일어납니다. 적절한 수면시간과 잠드는 시간을 유지하면 신체와 정신의 컨디션을 최적으로 유지할 수 있으며 일상생활에서 더 나은 퍼포먼스를 발휘할 수 있습니다. ")
                        .padding()
                        .font(.footnote)
                        .bold()
                    
                }
                VStack{
                    Text("스트레스에 관하여")
                        .fontWeight(.heavy)
                        .font(.title2)
                        .padding(.trailing,180)
                    Image("stress_2")
                        .resizable()
                        .frame(width: 300, height:300)
                    Text("스트레스는 일상에서 경험하는 정신적 또는 신체적인 압력과 긴장 상태를 의미합니다. 과도한 스트레스는 건강에 부정적인 영향을 줄 수 있으며, 피로, 불안, 집중력 저하 등의 증상을 초래할 수 있습니다.")
                        .multilineTextAlignment(.leading)
                        .padding()
                        .font(.footnote)
                        .bold()
                    
                    
                    
                }
                
            }
            
            
        }
    }
    func loadData_sleeptime() {
        sleeptimepoint.removeAll()

        for fatigue in fatigue.prefix(7) {
            let a = cal_sleeptime(fatigue.sleeptime ?? "unknown")
            sleeptimepoint.append(a)
        }
    }
    func loadData_sleephour() {
        sleephourpoint.removeAll()
        
        for fatigue in fatigue.prefix(7) {
            let a = cal_sleephour(fatigue.sleephour
                                  ?? "unknown")
            sleephourpoint.append(a)
        }
    }
    func loadData_stress() {
        stresspoint.removeAll()
        
        for fatigue in fatigue.prefix(7) {
            let a = cal_stress(fatigue.stress
                               ?? "unknown")
            stresspoint.append(a)
        }
    }
    func loadData_fatigue() {
        
        fatiguepoint.removeAll()
        
        for fatigue in _fatigue.wrappedValue.prefix(7) {
            let a = fatigue.fatigue
            fatiguepoint.append(Int(a))
        }    }
    func cal_sleeptime(_ sleeptime : String) -> Int{
        if sleeptime == "11시 이전"{
            return 100
        }else if sleeptime == "1시 이전"{
            return 75
        }else if sleeptime == "2시 이후"{
            return 50
        }else if sleeptime == "4시 이후"{
            return 25
        }else{
            return 10
        }
    }
    func cal_sleephour(_ sleephour :String) -> Int{
        if sleephour == "7시간 이상"{
            return 100
        }else if sleephour == "5-6시간"{
            return 75
        }else if sleephour == "3-4시간"{
            return 50
        }else if sleephour == "0-3시간"{
            return 25
        }else{
            return 10
        }
    }
    func cal_stress(_ stress : String)->Int{
        if stress == "100"{
            return 100
        }else if stress == "70"{
            return 70
        }else if stress == "50"{
            return 50
        }else if stress == "30"{
            return 30
        }else if stress == "0"{
            return 10
        }else{
            return 0
        }
    }
    }
    //받은값에 따라 int값 반환할것

struct BarView: View {
    
    var value: Int
    
    var body: some View {
        
        VStack {
            
            ZStack(alignment: .bottomTrailing){
                
                //받을 값의 범위에 따라 바꿔줘야함
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color.white)
                Capsule().frame(width: 30, height: CGFloat(value))
                    .foregroundColor(.orange)
                
            }
        }
    }
}
