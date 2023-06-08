//
//  WorkoutCCell.swift
//  todocapstone
//
//  Created by hufsaim on 2023/05/21.
//

import SwiftUI

struct WorkoutCCell: View {
    var workout = Workout(id: 0, name: "", imageName: "", duration: "", distance: 0, calories: 0)
    var body: some View {
        HStack{
            Image(workout.imageName)
                .resizable()
                .padding(.all,10.0)
                .frame(width:100,height: 100)
            VStack(alignment: .leading){
                //verbatim : 받는 그대로 표현하겟다
                Text(verbatim: workout.name)
                Text(verbatim: workout.duration)
                Text(verbatim: "\(workout.calories) calories")
                Text(verbatim: "\(workout.distance) miles")
            }
            .padding(.leading,10.0)
            Spacer()
        }
    }
}

struct WorkoutCCell_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCCell(workout:  WorkoutItems().workoutItems[0])
    }
}
