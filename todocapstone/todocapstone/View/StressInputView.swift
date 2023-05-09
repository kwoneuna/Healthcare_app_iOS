//
//  StressInputView.swift
//  demo_2
//
//  Created by 박민정 on 2023/04/30.
//

import SwiftUI

struct StressInputView: View {
    @State private var stressScore = 50.0
    @State private var stressDescription = ""

    var body: some View {
        VStack {
            Text("오늘의 스트레스 점수를 입력해주세요!")
                .font(.largeTitle)
                .bold()
                .padding(.top, 50)

            Spacer()
            Image("stress_2")
                .resizable()
                .aspectRatio(contentMode: .fit)
    
            

            HStack {
                Text("스트레스 점수:")
                Text("\(Int(stressScore))")
            }
            .padding()
            .bold()

            Slider(value: $stressScore, in: 1...100, step: 1)
                .padding()
                .accentColor(.orange)


            NavigationLink(destination: NextView()) {
                Text("입력")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            .padding(.bottom, 50)
        }
        .padding()
    }
}

struct NextView: View {
    var body: some View {
        Text("다음 화면")
            .font(.title)
            .navigationBarTitle("다음")
    }
}

struct StressInputView_Previews: PreviewProvider {
    static var previews: some View {
        StressInputView()
    }
}
