//
//  Home.swift
//  demo_2
//
//  Created by 박민정 on 2023/04/30.
//

import SwiftUI
import Charts

struct Home: View {
    @State var sampleAnalytics: [SleepHour] = sample_analytics
    @State var currentTab: String = "일주일"
    var body: some View {
        NavigationStack{
            VStack{
                //차트만들기
                VStack(alignment: .leading, spacing: 12){
                    HStack{
                        Text("시간")
                            .fontWeight(.semibold)
                        
                        Picker("", selection: $currentTab) {
                            Text("일주일")
                                .tag("일주일")
                            Text("주별")
                                .tag("주별")
                            Text("달별")
                                .tag("달별")
                        }
                        .pickerStyle(.segmented)
                        .padding(.leading,80)
                    }
                    
                    let totalValue = sampleAnalytics.reduce(0.0) { partialResult, item in
                        item.hour + partialResult
                    }
                    
                    Text(totalValue.stringFormat)
                        .font(.largeTitle.bold())
                        
                    
                    AnimatedChart()
                }
                .padding()
                .background{
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.white.shadow(.drop(radius:2)))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
            .navigationTitle("수면 데이터")
        }
    }
    
    @ViewBuilder
    func AnimatedChart() ->some View{
        let max = sampleAnalytics.max {item1, item2 in
            return item2.hour > item1.hour
        }? .hour ?? 0
        
        Chart{
            ForEach(sampleAnalytics){item in
                //바그래프
                BarMark(
                    x: .value("Date", item.day),
                    y: .value("Hours", item.animate ? item.hour : 0)
                )
            }
        }
        //그래프 조절
        .chartYScale(domain: 0...(max + 10))
        .frame(height: 250)
        .onAppear {
            for(index,_) in sampleAnalytics.enumerated(){
                withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 0.8, blendDuration: 0.8).delay(Double(index)*0.05)){
                    sampleAnalytics[index].animate = true
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


extension Double{
    var stringFormat: String{
        if self > 10000 && self < 999999{
            return String(format: "%.1fk", self/1000).replacingOccurrences(of: ".0", with: "")
        }
        if self > 999999{
            return String(format: "%.1fM", self / 100000).replacingOccurrences(of: "", with: "")
        }
        
        return String(format: "%.1f", self)
    }
}
