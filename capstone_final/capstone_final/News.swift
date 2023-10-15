//
//  example.swift
//  capstone_final
//
//  Created by hufsaim on 2023/08/13.
//

import SwiftUI

//건강기사 부분

struct health1 : View{
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 15).frame(width: 350,height: 250)
                .padding(.horizontal)
                .foregroundColor(.white)
                .shadow(radius: 10)
            
            VStack{
                Image("wash")
                    .resizable()
                    .frame(width: 350,height: 190)
                    .offset(x:0,y:-10)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.bottom,-10)
                
                VStack{
                    Text("손씻기로 건강을 지키는 법")
                        .font(.system(size: 20))
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .padding(.bottom,-3)
                    Text("손씻기가 중요한 이유에 대해 알아봅시다.")
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                }.padding(.bottom)
                
                    

                
                    
            }
        }
    }
}
struct health2 : View{
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 15).frame(width: 350,height: 250)
                .padding(.horizontal)
                .foregroundColor(.white)
                .shadow(radius: 10)
            
            VStack{
                Image("yoga")
                    .resizable()
                    .frame(width: 350,height: 190)
                    .offset(x:0,y:-10)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.bottom,-10)
                
                VStack{
                    Text("생리 주기에 관하여 알아보기")
                        .font(.system(size: 20))
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .padding(.bottom,-5)
                    Text("생리 주기를 추적하면 건강상태를 알 수 있습니다.")
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                }.padding(.bottom)
                
                    

                
                    
            }
        }
        
        
        
    }
}
struct health3 : View{
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 15).frame(width: 350,height: 250)
                .padding(.horizontal)
                .foregroundColor(.white)
                .shadow(radius: 10)
            
            VStack{
                Image("night")
                    .resizable()
                    .frame(width: 350,height: 190)
                    .offset(x:0,y:-10)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.bottom,-10)
                
                VStack{
                    Text("충분한 숙면을 취하는 방법")
                        .font(.system(size: 20))
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .padding(.bottom,-5)
                    Text("수면에 어려움이 있다면 이 팁을 활용해 보세요.")
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                }.padding(.bottom)
            }
        }
    }
}

//example
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

//example2
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

//example3
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
