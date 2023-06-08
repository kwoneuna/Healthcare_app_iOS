//
//  textblockview.swift
//  todocapstone
//
//  Created by hufsaim on 2023/06/03.
//

import SwiftUI

struct textblockview: View {
    @EnvironmentObject var data : Dataexample
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 200,height:60)
                .foregroundColor(.blue)
                .cornerRadius(9)
            Text("\(data.text) : \(data.counter)")
                .foregroundColor(.white)
        }
        .onTapGesture {
            data.counter += 1
        }
    }
}

struct textblockview_Previews: PreviewProvider {
    static var previews: some View {
        textblockview()
            .environmentObject(Dataexample())
    }
}
