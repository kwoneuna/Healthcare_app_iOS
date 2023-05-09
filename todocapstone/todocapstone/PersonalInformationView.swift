//
//  PersonalInformationView.swift
//  demo_2
//
//  Created by 박민정 on 2023/05/08.
//

import SwiftUI



struct PersonalInformationView: View {
    let genders = ["남성", "여성"]
    let ageRanges = ["10대", "20대", "30대", "40대", "50대", "60대", "70대", "80대"]
    let regions = ["서울", "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주도"]
    
    @State private var name: String = ""
    @State private var selectedGenderIndex: Int = 0
    @State private var selectedAgeRangeIndex: Int = 0
    @State private var selectedRegionIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 10){
            //            VStack(spacing:0){
            //                HStack{
            //                    Image("question")
            //                        .resizable()
            //                        .aspectRatio(contentMode: .fit)
            //                        .frame(height:350)
            //                        .padding(.top,40)
            //                }
            ////                Image("question")
            ////                    .resizable()
            ////                    .aspectRatio(contentMode: .fit)
            ////                    .frame(height:400)
            ////                    .padding(.top,40)
            //                HStack{
            //                    Text("당신에 대해 입력해주세요!")
            //                        .font(.largeTitle)
            //                        .bold()
            //                }
            ////                Text("당신에 대해 입력해주세요!")
            ////                    .font(.largeTitle)
            ////                    .bold()
            //            }
            HStack{
                Image("question")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:200)
                    .padding(.top,70)
                
            }
            //                Image("question")
            //                    .resizable()
            //                    .aspectRatio(contentMode: .fit)
            //                    .frame(height:400)
            //                    .padding(.top,40)
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
                Picker(selection: $selectedGenderIndex, label: Text("성별")) {
                    ForEach(0..<genders.count) {
                        Text(self.genders[$0]).tag($0)
                    }
                }
                
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 40)
                .padding(.top,30)
            }
            HStack{
                Picker(selection: $selectedAgeRangeIndex, label: Text("나이대")) {
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
                Picker(selection: $selectedRegionIndex, label: Text("지역")) {
                    ForEach(0..<regions.count) {
                        Text(self.regions[$0]).tag($0)
                    }
                }.pickerStyle(MenuPickerStyle())
                    .padding(.horizontal, 20)
                    .padding(.bottom,30)
                    .accentColor(.black)
            }
            HStack{
                Button(action: {
                    // submit button action
                }) {
                    Text("입력")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                }
            }
//            .padding(.top,30)
        }.padding(.bottom,100)
    }
}



struct PersonalInformationView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInformationView()
    }
}

