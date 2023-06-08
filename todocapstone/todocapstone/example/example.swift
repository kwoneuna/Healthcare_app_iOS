//
//  example.swift
//  todocapstone
//
//  Created by hufsaim on 2023/05/16.
//

import SwiftUI
//손씻기로 건강
struct example: View {
    var body: some View{
        ScrollView{
            VStack(alignment: .leading){
                
                Image("wash")
                    .resizable()
                    .frame(width: 400,height: 250)
                    .offset(x:0,y:-10)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.bottom,-10)
                    .padding()
                Text("손씻기로 건강을 지키는 방법")
                    .font(.title)
                    .bold()
                    .padding(.leading,30)
                Text("손씻기는 질병을 예방할 수 있는 가장 중요한 방법입니다. 제대로 씻을 때만 효과적이지만, 대부분 올바른 방법을 따르지 않습니다. 한 연구에서는 95%에 달하는 사람들이 손을 너무 빨리 씻거나, 비누를 쓰지 않고 물로만 씻거나, 아니면 아예 씻지 않는다는 결과가 나왔습니다")
                    .padding(.leading,30)
                    .padding(.top,3)
                    .lineSpacing(5)
                
                Text("손씻기가 중요한 이유")
                    .padding(.leading,30)
                    .padding(.top,5)
                    .font(.title2)
                    .bold()
                Text("바이러스, 박테리아 및 기타 세균은 표면, 물체 또는 다른 사람과의 접촉을 통해 옮을 수 있습니다")
                    .padding(.leading,30)
                    .padding(.top,3)
                Text("문손잡이, 주유기, 악수 등을 통해서 세균이 옮을 수 있습니다. 그 후 간지러운 코를 만지는 것만으로도 세균이 신체로 옮겨갈 수도 있고 감염이 일어날 수 있습니다")
                    .padding(.leading,30)
                    .padding(.top,2)

                Text("손을 씻으면 이러한 세균을 없앨 수 잇고 건강을 보호할 수 있습니다")                           .padding(.leading,30)
                    .padding(.top,3)
                
                Text("올바르기 손씻기")
                    .font(.title2)
                    .bold()
                    .padding(.leading,30)
                    .padding(.top,5)
                Text("손을 올바르기 씻기 위한 4단계입니다")
                    .padding(.leading,30)
                    .padding(.top,3)
                
                

                
                
            }
            VStack(alignment: .leading){
                Text("1. 흐르는 물에 손을 적시고, 수도꼭지를 잠근 다음, 비누를 바르십시오. 세면대에 담겨있는 물은 사용하지 마십시오. 물은 이미 오염된 경우에는 사람도 감염될 수 있습니다.")
                    .lineSpacing(3)
                    .padding(.leading,28)
                    .padding(.top,3)
                Text("2. 비누로 거품을 내고 손등, 손가락 사이, 손톱 아래까 지 비누칠을 하십시오. 적어도 20초 동안 손을 빡빡 문지르십시오. 타이머가 필요하면 알파벳송을 두 번 흥얼거리며 부르십시오.")
                    .lineSpacing(3)
                    .padding(.leading,28)
                    .padding(.top,3)
                Text("3. 흐르는 깨끗한 물로 손을 헹구어서 입자가 피부에서 떨어지고 씻겨 나가도록 합니다")
                    .lineSpacing(3)
                    .padding(.leading,28)
                    .padding(.top,3)
                Text("4. 깨끗한 수건으로 닦거나 자연 건조하여 손을 잘 말립니다. 세균은 젖은 손을 통해 더 쉽게 옮겨갈 수 있습니다")
                    .lineSpacing(3)
                    .padding(.leading,28)
                    .padding(.top,3)
            }
        }
        
    }
}

struct example_Previews: PreviewProvider {
    static var previews: some View {
        example()
    }
}
