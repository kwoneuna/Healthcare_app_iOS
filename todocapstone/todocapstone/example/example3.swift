//
//  example3.swift
//  todocapstone
//
//  Created by hufsaim on 2023/05/16.
//

import SwiftUI

struct example3: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                
                Image("night")
                    .resizable()
                    .frame(width: 400,height: 250)
                    .offset(x:0,y:-10)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.bottom,-10)
                    .padding()
                Text("충분한 숙면을 취하는 방법 알아보기")
                    .font(.title)
                    .bold()
                    .padding(.leading,30)
                
                Text("사용자가 깨어있을 때 하는 일이 수면에 큰 영향을 줄 수 있습니다. 숙면을 취해서 상쾌하게 일어날 수 있도록 돕는 몇가지 팁이 있습니다.")
                    .padding(.leading,30)
                    .padding(.top,3)
                    .lineSpacing(5)
                
                Text("낮 시간 동안")
                    .padding(.leading,30)
                    .padding(.top,5)
                    .font(.title2)
                    .bold()
                Text("주기적으로 햇볓을 쬐십시오. 하루에 적어도 30분 이상, 오전시간이 좋습니다")
                    .padding(.leading,30)
                    .padding(.top,3)
               
                Text("니코틴과 카페인을 피하십시오. 두가지 모두 각성 효과가 있습니다")
                    .padding(.leading,30)
                    .padding(.top,2)

                Text("규칙적으로 투여하는 약이 있는경우, 효과에 대하여 의사와 상의하십시오.")                           .padding(.leading,30)
                    .padding(.top,3)
                Text("낮잠을 잔다면 취침하기 6시간 이내는 피하십시오.")                           .padding(.leading,30)
                    .padding(.top,3)
                Text("운동은 적어도 잠들기 2~3시간 이전에 하십시오.")                           .padding(.leading,30)
                    .padding(.top,3)
                Text("잠들기 2~3시간 이내에는 많은양의 음식이나 음료 섭취를 삼가십시오")                           .padding(.leading,30)
                    .padding(.top,3)
                
                
            }
            VStack(alignment: .leading){
                Text("잠들기 전 취침 준비 시간")
                    .font(.title2)
                    .bold()
                    .padding(.top,5)
                    .padding(.trailing,100)
                    .padding(.bottom,3)

                Text("침대로 들어가기전에 편안하게 휴식을 취하면 더 쉽게 잠들수도 있습니다")
                    .padding(.bottom,3)

                Text("알코올은 수면의 질을 떨어뜨릴 수 있습니다")
                    .padding(.bottom,3)

                Text("저녁에는 전등을 어둡게 하십시오. 잠들 시간이라는 것을 신체가 인식할 수 있습니다.")
                    .padding(.bottom,3)

                Text("잠자리에 들기 전 긴장을 푸십시오. 책을 읽거나, 음악을 듣거나, 일기를 쓰십시오")
                    .padding(.bottom,3)

                
            }.padding()
            VStack(alignment: .leading){
                Image("pillow")
                    .resizable()
                    .frame(width: 400,height: 250)
                    .offset(x:0,y:-10)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.bottom,-10)
                    .padding()
                Text("취침시간")
                    .font(.title2)
                    .bold()
                    .padding(.top,5)
                    .padding(.bottom,3)
                    .padding(.leading,30)
                    
                
                Text("침실이 잠드는데 도움이 되는 환경인지 확인하십시오")
                    .lineSpacing(3)
                    .padding(.leading,28)
                    .padding(.top,3)
                Text("침실은 시원하고 어두운 상태를 유지하십시오.")
                    .lineSpacing(3)
                    .padding(.leading,28)
                    .padding(.top,3)
                Text("전자 기기나 다른 방해 요소를 침실 안에 두지 마십시오.")
                    .lineSpacing(3)
                    .padding(.leading,28)
                    .padding(.top,3)
                Text("깨어있는 상태로 침대에 누워 있지 마십시오. 20분 이상 깨어 있는 상태이면, 일어나서 잠이 올 때까지 긴장을 풀 수 있는 일을 하십시오.")
                    .lineSpacing(3)
                    .padding(.leading,28)
                    .padding(.top,3)
            }
        }    }
}

struct example3_Previews: PreviewProvider {
    static var previews: some View {
        example3()
    }
}
