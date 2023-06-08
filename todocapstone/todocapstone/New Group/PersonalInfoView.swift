//
//  PersonalInfoView.swift
//  capstone_immune
//
//  Created by 박민정 on 2023/05/30.
//

import Foundation
import SwiftUI

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
                HStack{
                    Text("피로도 : ")
                        .bold()
                    TextField("피로도를 입력하세요", value: $fatigue,format:.number)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.orange)
                        .keyboardType(.default)
                    
                }
                HStack{
                    Button("저장"){
                        userInfo.temperature = temperature
                        userInfo.name = name
                        userInfo.regionindex = regionindex
                        userInfo.agerangeindex = agerangeindex
                        userInfo.genderindex = genderindex
                        userInfo.fatigue = fatigue
                        userInfo.isEnteringPersonalInfo = false
                        isFirstLaunching.toggle()
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
