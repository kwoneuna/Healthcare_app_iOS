//
//  exercise_view.swift
//  todocapstone
//
//  Created by hufsaim on 2023/05/04.
//

import SwiftUI

struct exercise_view: View {
    var body: some View {
        
        ScrollView(.vertical,showsIndicators: false){
            exercise_home()
        }
        .frame(maxWidth: .infinity)
        .background(){
            ZStack{
                VStack{
                    Circle()
                        .fill(Color.green)
                        .scaleEffect(0.6)
                        .offset(x:20)
                        .blur(radius: 120)
                    Circle()
                        .fill(Color.red)
                        .scaleEffect(0.6,anchor: .leading)
                        .offset(x:-20)
                        .blur(radius: 120)                }
                Rectangle().fill(.ultraThinMaterial)
            }
            
        }
        //.preferredColorScheme(.dark)
    }
}

struct exercise_view_Previews: PreviewProvider {
    static var previews: some View {
        exercise_view()
    }
}
