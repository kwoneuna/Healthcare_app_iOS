//
//  enterview.swift
//  todocapstone
//
//  Created by hufsaim on 2023/05/30.
//

import SwiftUI
import Combine
//수면 값 입력 받아서 보여줄거임
//class ObservableList: ObservedObject {
//    @Published var list: [String]
//}
//데이터 구조
//struct Sleep {
//    let sleephour : Int
//    let sleeptime : Int
//    let sleepdate : Date
//}
class SleepView: ObservableObject {
    @Published var sleephour : Int = 0
    @Published var sleeptime : Int = 0
    func calculateTotal() -> Int{
        let sum = sleephour + sleeptime
        return sum
    }
}

struct enterview: View {
    @ObservedObject var sleepmodel = SleepView()
    @State private var sleepHours = 0
    @State private var isInputComplete = false
    
    var body: some View {
        
            VStack{
                
                if !isInputComplete{
                    Text("잠든 시간을 입력해주세요")
                        .font(.title)
                        .bold()
                        .padding()
                    HStack{
                        Button {
                            sleepmodel.sleeptime = 30
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray)
                                    .frame(width: 130,height: 30)
                                Text("11시 이전")
                                    .foregroundColor(.white)
                                    .padding()
                            }
                        }.padding(.trailing)
                            
                        Button {
                            sleepmodel.sleeptime = 20
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray)
                                    .frame(width: 130,height: 30)
                                Text("1시 이전")
                                    .foregroundColor(.white)
                                    .padding()
                            }
                    }
                    }.padding(.bottom,-3)
                    HStack{
                        Button {
                            sleepmodel.sleeptime = 10
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray)
                                    .frame(width: 130,height: 30)
                                Text("2시 이후")
                                    .foregroundColor(.white)
                                    .padding()
                            }
                        }.padding(.trailing)
                        Button {
                            sleepmodel.sleeptime = 5
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray)
                                    .frame(width: 130,height: 30)
                                Text("4시 이후")
                                    .foregroundColor(.white)
                                    .padding()
                            }
                    }
                    }


        //            Text("selected : \(formattedTime(wakeup))")
                    
                    Text("수면 시간을 입력해주세요")
                        .font(.title)
                        .bold()
                        .padding()
                    Stepper(value: $sleepHours, in: 0...12, step:1){
                        Text("\(sleepHours) 시간")
                            .font(.title3)
                            .bold()
                            .padding(.leading,80)
                            .background()
                    }.padding(.horizontal,50)
                        .padding(.bottom,50)
                    Button("입력 완료"){
                        if sleepHours >= 7{
                            sleepmodel.sleephour = 35
                        } else if 4 < sleepHours && sleepHours <= 6  {
                            sleepmodel.sleephour = 25
                        } else if 2 < sleepHours && sleepHours  <= 4{
                            sleepmodel.sleephour = 15
                        } else if 0 < sleepHours && sleepHours <= 2{
                            sleepmodel.sleephour = 10
                        }else{
                            sleepmodel.sleephour = 0
                        }
                        self.isInputComplete = true
                    }
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
                    .navigationBarHidden(true)
                } else {
                    Text("\(sleepmodel.sleephour)")
                    Text("\(sleepmodel.sleeptime)")
                    Text("\(sleepmodel.calculateTotal())")
                    Text("입력을 완료했습니다.")
                        .font(.title)
                        .padding()
                }
                
        }
        
        }
  
}

struct enterview_Previews: PreviewProvider {
    static var previews: some View {
        enterview()
            
    }
    //}
}
