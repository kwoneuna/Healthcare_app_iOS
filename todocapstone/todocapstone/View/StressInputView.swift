//
//  StressInputView.swift
//  demo_2
//
//  Created by 박민정 on 2023/04/30.
//

import SwiftUI
import Combine
class Stress: ObservableObject{
    @Published var stress_score : Int = 0

    func calculateTotal() -> Int {
        return stress_score
    }
}

struct StressInputView: View {
    @ObservedObject var data : Stress
    @State var ss: Int = 0
    @State var stressScore = 50.0
    @State var stress = 0.0
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
            .font(.title2)
            .padding()
            .bold()

            Slider(value: $stressScore, in: 1...100, step: 1)
                .padding()
                .accentColor(.orange)
            
            Button {
                //stress 주기
                //내가 스트레스받는다
                data.stress_score = Int(stressScore*0.35)
              

            } label: {
                Text("입력")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            
            .padding(.bottom,50)
            



        }
        .padding()
        
    }
}


struct StressInputView_Previews:
    PreviewProvider {

    static var previews: some View {
        StressInputView(data: Stress())
    }
}
