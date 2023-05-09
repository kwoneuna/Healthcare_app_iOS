//
//  avartar.swift
//  todocapstone
//
//  Created by hufsaim on 2023/04/29.
//

import SwiftUI

struct avartar: View {
    var body: some View {
        ZStack{
            
            Image("KakaoTalk_Photo_2023-05-08-22-16-59").resizable().aspectRatio(contentMode: .fit)
                .background{
                    Circle()
                     .strokeBorder(
                         AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
                     )
                     .frame(width: 450)
                }
            
        }
    }
}

struct avartar_Previews: PreviewProvider {
    static var previews: some View {
        avartar()
    }
}
