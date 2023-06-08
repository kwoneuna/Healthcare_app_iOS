//
//  avartar.swift
//  todocapstone
//
//  Created by hufsaim on 2023/04/29.
//

import SwiftUI

struct avartar: View {
    @State private var fatigue = 0
    @State private var immunity = 0
    var body: some View {
        VStack{
            ZStack{
                
                Image("KakaoTalk_Photo_2023-05-08-22-16-59").aspectRatio(contentMode: .fit)
                   
                
            }
//            HStack{
//                
//                ZStack{
//                    RoundedRectangle(cornerRadius: 15)
//                        
//                        .stroke(Color.orange, lineWidth: 5)
//                        .frame(width: 160,height: 200)
//                        .padding()
//                    VStack{
//                        Text("피로도 점수")
//                            .padding()
//                        Text(String(fatigue))
//                    }
//                   
//                    
//                    
//                }
//               
//
//                
//                ZStack{
//                    RoundedRectangle(cornerRadius: 15)
//                        .stroke(Color.orange,lineWidth : 5)
//                        .frame(width: 160,height: 200)
//                        .padding()
//                    VStack{
//                        Text("면역력 점수")
//                            .padding()
//                        Text(String(immunity))
//                    }
//                    
//                    
//                }
//            }
//            .bold()
            .font(.title)
        }
        
    }
}

struct avartar_Previews: PreviewProvider {
    static var previews: some View {
        avartar()
    }
}
