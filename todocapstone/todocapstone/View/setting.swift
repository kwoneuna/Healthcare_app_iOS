//
//  setting.swift
//  todocapstone
//
//  Created by hufsaim on 2023/04/30.
//

import SwiftUI

struct setting: View {
    var body: some View {
        VStack{
            HStack{
                Text("설정")
                    .font(.title)
                    .fontWeight(.bold)
                    .background{
                        Capsule()
                            .fill(.ultraThinMaterial)
                    }
                
                
            }
            Text("")
           
            
            
        }
    }
}

struct setting_Previews: PreviewProvider {
    static var previews: some View {
        setting()
    }
}
