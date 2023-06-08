//
//  Setting.swift
//  todocapstone
//
//  Created by hufsaim on 2023/06/08.
//

import Foundation
import SwiftUI

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
                        Text("\(userInfo.fatigue)")
                    }
                    HStack{
                        Text("\(userInfo.immunityLevel)")
                    }
//                    HStack{
//                        Text("\(userInfo.fatigue)")
//
//                    }
//                    VStack{
//                        Text("\(userInfo.sleep_score_1)")
//                        Text("\(userInfo.stress_score)")
//                    }
                }
            }.navigationBarTitle(Text("프로필"))
        }
    }
}
