//
//  example2.swift
//  todocapstone
//
//  Created by hufsaim on 2023/05/16.
//

import SwiftUI


struct example2: View {
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Image("yoga")
                    .resizable()
                    .frame(width: 400,height: 250)
                    .offset(x:0,y:-10)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.bottom,-10)
                    .padding()
                Text("생리주기에 관해 알아보기")
                    .font(.title)
                    .bold()
                    .padding(.leading,30)
                Text(" 생리 주기는 건강에서 중요한 부분입니다. 뇌, 호르몬, 난소 및 자궁 등 신체에서 많은 부분이 포함되기 때문에 흔 히 여섯 번째 활력 징후라고 불리기도 합니다. 생리 주기 는 달마다 변하며 사람에 따라 다릅니다. 자신의 정상적 인 생리 주기를 이해하는 데 가장 좋은 방법은 생리를 기 록하고 확인하는 것입니다.")
                    .padding(.leading,30)
                    .padding(.top,3)
                    .lineSpacing(5)
                    .padding(.horizontal,3)
                    .minimumScaleFactor(0.2)
                Text("생리 주기는 무엇일까요?")
                    .padding(.leading,30)
                    .padding(.top,5)
                    .font(.title2)
                    .bold()
                Text("출혈이 시작된 첫날은 생리 및 생리 주기가 시작된 날입니다.   생리 주기의 전반부 동안 호르몬은 난소에서 난자 를 배출할 준비를 하며 이를 배란이라고 합니다. 배란 5 일 전부터 배란 당일까지가 생리 주기 중 임신 가능성이 높은 날입니다. 배란은 다음 생리가 시작되기 약 2주 전 에 일어나며 수정된 난자를 품기 위해 자궁 내막이 점점 두꺼워집니다. 난자가 수정되지 않으면 내막이 분해됩니 다. 수정된 난자가 없으면 자궁 내막이 허물어지고 질을 통해 배출되며 다음 생리가 시작됩니다.")
                    .padding(.leading,30)
                    .padding(.top,3)
                    .lineSpacing(5)
                
                Text("일반적인 생리주기는 무엇일까요?")
                    .padding(.leading,30)
                    .padding(.top,5)
                    .font(.title2)
                    .bold()
                Text("생리 주기는 생리가 시작된 첫날부터 다음 생리 전날까지 기간을 측정한 것입니다. 출혈은 보통 4일에서 7일까지 지속됩니다. 생리 주기는 보통 25일에서 30일간 지속되며 나이가 어릴수록 일정하지 않을 확률이 높습니다. 생리 주기 길이는 나이가 들면서 일정해지거나 규칙적으로 변하며 폐경에 가까워지면서 다시 예측하기 어렵게 변합 니다. 나이에 관계없이 약간의 생리 주기 변화는 충분히 있을 수 있는 현상입니다.")
                    .padding(.leading,30)
                    .padding(.top,3)
                    .lineSpacing(5)
                Text("생리 주기의 특정 시간에 생리통, 복부 팽만, 피로감, 여 드름 또는 두통과 같은 증상을 경험하는 것도 일반적일 수 있습니다. 사용자의 생리 주기가 친구나 가족의 생리 주기와 크게 차이가 날 수 있으며, 이러한 차이가 나더라도 정상입니다.")
                    .padding(.leading,30)
                    .padding(.top,3)
                    .lineSpacing(5)
          
            }
            Text("정말 중요한 것은 사용자의 정상 주기입니다. 생리 주기를 추적하는 것은 주기 길이 및 생리 기간을 이해하는 데 도움이 됩니다. 평소에 생리 주기가 얼마나 지속되는 지를 알고 있으면, 건강상 중요한 차이가 생겼다는 것을 암시하는 중대한 변화를 알아볼 수 있습니다. 예를 들어 생리 주기가 규칙적이다가 갑자기 이상 패턴이 감지되거나 증상이 악화되는 경우, 이를 바로 감지하여 의사와 상담할 수 있습니다. ")
                .padding(.leading,30)
                .padding(.top,3)
                .lineSpacing(5)
        }
    }
    
}


struct example2_Previews: PreviewProvider {
    static var previews: some View {
        example2()
    }
}
