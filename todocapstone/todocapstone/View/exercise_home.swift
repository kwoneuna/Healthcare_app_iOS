//
//  exercise_home.swift
//  todocapstone
//
//  Created by hufsaim on 2023/05/04.
//

import SwiftUI

struct exercise_home: View {
    //makr : UI properties
    @State var currentweek: [Date] = []
    @State var currentDay: Date = Date()
    
    //mark : animation properties
    @State var showViews: [Bool] = Array(repeating: false, count: 5)
    var body: some View {
        Spacer()
        VStack(spacing:20){
            HStack{
                Text("Current week")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                Spacer()
                
                Button{
                    
                } label: {
                    Image(systemName: "ellipasis.ciclre")
                        .font(.title3)
                }
            }.foregroundColor(.white)
                .opacity(showViews[0] ? 1 : 0)
                .offset(y: showViews[0] ? 0 : 200)
            // Mark : current week view
            HStack(spacing: 10){
                ForEach(currentweek,id: \.self){date in
                    Text(extractDate(date: date))
                        .fontWeight(isSameDay(date1: currentDay, date2: date) ? .bold: .semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical,isSameDay(date1: currentDay, date2: date) ? 6 : 0)
                        .padding(.horizontal,isSameDay(date1: currentDay, date2: date) ? 12 : 0)
                        .frame(width: isSameDay(date1: currentDay, date2: date) ? 140 : nil)
                        .background{
                            Capsule()
                                .fill(.ultraThinMaterial)
                                .environment(\.colorScheme, .light)
                                .opacity(isSameDay(date1: currentDay, date2: date) ? 0.8 : 0)
                        }
                        .onTapGesture {
                            withAnimation {
                                currentDay = date
                            }
                        }
                }
            }
            .padding(.top,10)
            .opacity(showViews[1] ? 1 : 0)
            .offset(y: showViews[1] ? 0 : 250)
            
            
            VStack(alignment: .leading, spacing: 8){
                Text("Steps")
                    .fontWeight(.semibold)
                Text("6,243")
                    .font(.system(size:45, weight: .bold))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical,10)
            .opacity(showViews[2] ? 1 : 0)
            .offset(y: showViews[2] ? 0 : 200)
            //Mark : fitness ring view
            FitnessRingCardView()
                .opacity(showViews[3] ? 1 : 0)
                .offset(y: showViews[3] ? 0 : 250)
            
            //MARK : Bar graph View
            FitnessStepsGraphView()
                .opacity(showViews[4] ? 1 : 0)
                .offset(y: showViews[4] ? 0 : 200)
        }.padding()
            .onAppear(perform: extractCurrentWeek)
            .onAppear(perform: animateViews)
    }
    //Mark : Animating view
    func animateViews(){
        withAnimation(.easeInOut){
            showViews[0] = true
        }
        withAnimation(.easeInOut.delay(0.1)){
            showViews[1] = true
        }
        withAnimation(.easeInOut.delay(0.15)){
            showViews[2] = true
        }
        withAnimation(.easeInOut.delay(0.2)){
            showViews[3] = true
        }
        withAnimation(.easeInOut.delay(0.35)){
            showViews[4] = true
        }

    }
    //Mark : Extracting current week
    func extractCurrentWeek(){
        let calendar = Calendar.current
        let week = calendar.dateInterval(of: .weekOfMonth, for: Date())
        guard let firstDay = week?.start else{
            return
        }
        (0..<7).forEach { day in
            if let weekDay = calendar.date(byAdding: .day, value: day, to: firstDay){
                currentweek.append((weekDay))
            }
        }
    }
    
    //Mark : extracting custome data components
    func extractDate(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = (isSameDay(date1: currentDay, date2: date) ? "dd MMM" : "dd")
        return (isDateToday(date : date) && isSameDay(date1: currentDay, date2: date) ? "Today," : "") +  formatter.string(from: date)
    }
    //Mark check data is today or some day
    func isDateToday(date : Date) -> Bool{
        let calender = Calendar.current
        return calender.isDateInToday(date)
    }
    
    func isSameDay(date1 : Date,date2 : Date)->Bool{
        let calender = Calendar.current
        return calender.isDate(date1,inSameDayAs : date2)
    }
}

struct exercise_home_Previews: PreviewProvider {
    static var previews: some View {
        exercise_view()
    }
}
