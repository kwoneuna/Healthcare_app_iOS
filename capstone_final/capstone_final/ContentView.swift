//
//  ContentView.swift
//  capstone_final
//
//  Created by 박민정 on 2023/07/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var userInfo = UserInfo()
    @State var isContentReady : Bool = false
    @State var  isFirstLaunching : Bool = true
    
    var body: some View {
        TabView{
            MainView(userInfo: userInfo)
                .tabItem {
                    Image(systemName: "checkmark.seal")
                    Text("Main")
                }
            Avatar(userInfo:userInfo)
                .tabItem({
                    Image(systemName: "person")
                    Text("Avartar")
                })
            Setting(userInfo: userInfo)
                .tabItem {
                    Image(systemName: "house")
                    Text("Setting")
                }
            
        }.fullScreenCover(isPresented: $isFirstLaunching) {
            PersonalInfoView(isFirstLaunching : $isFirstLaunching, userInfo: userInfo)
        }
        .environmentObject(userInfo)
    }
  
}

//Avatar
struct Avatar: View {
    @ObservedObject var userInfo: UserInfo
    @State private var isShowingImage1 = true
    @State private var isShowingImage2 = true
    @State var isAnimation = false
    @State private var value = true
    @State private var isShaking = false
    
    var body: some View {
        
        ZStack{
            Image("room2")
                .resizable()
            //boundary 구현
            if userInfo.immunityLevel == "Strong"{
                Circle()
                    .fill(Color.orange.opacity(0.25))
                    .frame(width:400, height:400)
                    .scaleEffect(isAnimation ? 0.95 : 1)
                    .animation(Animation.easeInOut(duration:1).repeatForever(), value: value)
            } else if userInfo.immunityLevel == "Moderate"{
                Circle()
                    .fill(Color.orange.opacity(0.25))
                    .frame(width:300, height:300)
                    .scaleEffect(isAnimation ? 0.95 : 1)
                    .animation(Animation.easeInOut(duration:1).repeatForever(), value: value)
            }else{
                Circle()
                    .fill(Color.orange.opacity(0.25))
                    .frame(width:200, height:200)
                    .scaleEffect(isAnimation ? 0.95 : 1)
                    .animation(Animation.easeInOut(duration:1).repeatForever(), value: value)
            }
            if userInfo.genderindex == 0{
                VStack{
                    Image("armL_M")
                        .rotationEffect(Angle(degrees: isShaking ? 10 : 0))
    //                    .offset(x:5,y:3)
                }
                .onAppear{
                    startShakeAnimation()
                }
                Image("body_M")
                VStack{
                    Image("armR_M")
                        .rotationEffect(Angle(degrees: isShaking ? -10 : 0))
                }
                VStack{
                    if isShowingImage1 {
                        Image("eyeL_M")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else {
                        Image("eyecloseL_M")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
//                .animation(.easeInOut(duration: 1))
                .onAppear {
                    startAnimation()
                }
                VStack{
                    if isShowingImage2{
                        Image("eyeR_M")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else{
                        Image("eyecloseR_M")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
//                .animation(.easeInOut(duration:1))
                .onAppear{
                    startAnimation2()
                }
                Image("mouth_M")

            }else{
                //여자 아바타
                Image("hair")
                VStack{
                    Image("armL")
                        .rotationEffect(Angle(degrees: isShaking ? 10 : 0))
    //                    .offset(x:5,y:3)
                }
                .onAppear{
                    startShakeAnimation()
                }
                Image("body3")
                VStack{
                    Image("armR")
                        .rotationEffect(Angle(degrees: isShaking ? -10 : 0))
                }
                VStack{
                    if isShowingImage1 {
                        Image("eyeL")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else {
                        Image("eyeLclose")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .animation(.easeInOut(duration: 1))
                .onAppear {
                    startAnimation()
                }
                VStack{
                    if isShowingImage2{
                        Image("eyeR")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else{
                        Image("eyeRclose")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
//                .animation(.easeInOut(duration:1))
                .onAppear{
                    startAnimation2()
                }
                Image("mouth")
            }
        }
        .onAppear(){
            withAnimation(.linear(duration:1)){
                self.isAnimation.toggle()
                value = false
            }
        }
    }
    func startAnimation() {
        withAnimation {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isShowingImage1.toggle()
                startAnimation()
                }
            }
        }
            
    func startAnimation2() {
        withAnimation {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isShowingImage2.toggle()
                startAnimation2()
                }
            }
        }
    
    func startShakeAnimation(){
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
            withAnimation(Animation.spring(response: 0.2, dampingFraction: 3, blendDuration: 0.2)) {
                isShaking.toggle()
            }
        }
    }
}

//Setting
struct Setting : View{
    let genders = ["남성", "여성"]
    let ageRanges = ["10대", "20대", "30대", "40대", "50대", "60대", "70대", "80대"]
    let regions = ["서울", "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주도"]
    
    @ObservedObject var userInfo: UserInfo
    
    var body: some View{
        NavigationView{
            Form{
                Section(header: Text("이름")){
                    Text("\(userInfo.name)")
                }
                Section(header: Text("성별")){
                    Text("\(genders[userInfo.genderindex])")
                }
                Section(header: Text("나이대")){
                    Text("\(ageRanges[userInfo.agerangeindex])")
                }
                Section(header: Text("지역")){
                    HStack{
                        Text("\(regions[userInfo.regionindex])")
                    }
                    HStack{
                        Text("\(userInfo.temperature)℃")
                    }
                }
                Section(header: Text("점수")){
                    HStack{
                        Text("\(userInfo.immunityLevel)")
                    }
                }
            }.navigationBarTitle(Text("프로필"))
        }
    }
}

//UserInfo
class UserInfo: ObservableObject {
    
    @Published var isLoading = true
    @Published var isEnteringPersonalInfo = false
    @Published var isEnteringConditionInfo = true
    @Published var name = ""
    @Published var regionindex : Int = 0
    @Published var agerangeindex : Int = 0
    @Published var genderindex : Int = 0
    @Published var temperature : Int = 0
    @Published var fatigue: Double = 0.0
    
    func setUserInfo(name: String, regionindex: Int, agerangeindex:Int, genderindex:Int, temperature: Int, fatigue:Double){
        self.name = name
        self.regionindex = regionindex
        self.agerangeindex = agerangeindex
        self.genderindex = genderindex
        self.temperature = temperature
        self.fatigue = fatigue
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
        fatiguevalue = 34 - Int(fatigue * 0.34)
        
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

//PersonalInfoView
struct PersonalInfoView: View{
    let genders = ["남성", "여성"]
    let ageRanges = ["10대", "20대", "30대", "40대", "50대", "60대", "70대", "80대"]
    let regions = ["서울", "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주도"]
    
    @Binding var isFirstLaunching : Bool
    @ObservedObject var userInfo: UserInfo
    @State var name : String = ""
    @State var regionindex : Int = 0
    @State var agerangeindex : Int = 0
    @State var genderindex : Int = 0
    @State var temperature : Int = 0
    @State var fatigue : Double = 0.0
    @State var initialFatigue: Double = 0.0
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                HStack{
                    Image("question")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height:200)
                        .padding(.top,70)
                    
                }
                Text("당신에 대해 입력해주세요!")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                HStack{
                    Text("이름 : ")
                        .bold()
                    TextField("이름을 입력하세요", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.orange)
                        .keyboardType(.default)
                    
                }
                .padding(.horizontal,30)
                HStack{
                    Picker(selection: $genderindex, label: Text("성별")) {
                        ForEach(0..<genders.count) {
                            Text(self.genders[$0]).tag($0)
                        }
                    }
                    
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 40)
                    .padding(.top,30)
                }
                HStack{
                    Picker(selection: $agerangeindex, label: Text("나이대")) {
                        ForEach(0..<ageRanges.count) {
                            Text(self.ageRanges[$0]).tag($0)
                                .font(.system(size:100))
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .frame(width:200, height:100)
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    .accentColor(.black)
                    
                }
                HStack{
                    Picker(selection: $regionindex, label: Text("지역")) {
                        ForEach(0..<regions.count) {
                            Text(self.regions[$0]).tag($0)
                        }
                    }.pickerStyle(MenuPickerStyle())
                        .padding(.horizontal, 20)
                        .padding(.bottom,30)
                        .accentColor(.black)
                    
                }
                Button(action: {
                    fetchTemperature()
                }) {
                    Text("온도 가져오기")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                Text("현재 온도: \(temperature)℃")
                    .padding()
//                HStack{
//                    Text("피로도 : ")
//                        .bold()
//                    TextField("피로도를 입력하세요", value: $fatigue,format:.number)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .foregroundColor(.orange)
//                        .keyboardType(.default)
                
//                }
                HStack{
                    Button("저장"){
                        let fatigueValue = initialFatigue
//                        userInfo.temperature = temperature
//                        userInfo.name = name
//                        userInfo.regionindex = regionindex
//                        userInfo.agerangeindex = agerangeindex
//                        userInfo.genderindex = genderindex
//                        userInfo.fatigue = fatigue
                        userInfo.setUserInfo(name: name, regionindex: regionindex, agerangeindex: agerangeindex, genderindex: genderindex, temperature: temperature, fatigue: fatigueValue)
                        isFirstLaunching = false
                    }
                }
            }
        }
    }
    func fetchTemperature() {
        let apiKey = "73a8efe415e6c630c9b14946aeefcdba"
        let baseURL = "https://api.openweathermap.org/data/2.5/weather"
        
        let regionQuery: String
        
        switch regionindex {
        case 0:
            regionQuery = "Seoul"
        case 1:
            regionQuery = "Gyeonggi-do"
        case 2:
            regionQuery = "Gangwon-do"
        case 3:
            regionQuery = "Chungcheongbuk-do"
        case 4:
            regionQuery = "Chungcheongnam-do"
        case 5:
            regionQuery = "Jeollabuk-do"
        case 6:
            regionQuery = "Jeollanam-do"
        case 7:
            regionQuery = "Gyeongsangbuk-do"
        case 8:
            regionQuery = "Gyeongsangnam-do"
        case 9:
            regionQuery = "Jeju-do"
        default:
            regionQuery = ""
        }
        
        guard !regionQuery.isEmpty else {
            print("Invalid region selected")
            return
        }
        
        let url = "\(baseURL)?q=\(regionQuery)&appid=\(apiKey)"
        
        guard let apiURL = URL(string: url) else {
            print("Invalid API URL")
            return
        }
        
        URLSession.shared.dataTask(with: apiURL) { data, response, error in
            if let error = error {
                print("Error fetching temperature: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Invalid response data")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let weatherData = json as? [String: Any],
                   let main = weatherData["main"] as? [String: Any],
                   let temp = main["temp"] as? Double {
                    DispatchQueue.main.async {
                        self.temperature = Int(temp - 273) // 온도 변환 (절대온도에서 섭씨로 변환)
                    }
                }
            } catch {
                print("Error parsing response data: \(error.localizedDescription)")
            }
        }.resume()
    }
}

