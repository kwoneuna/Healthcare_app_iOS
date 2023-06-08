//
//  test2.swift
//  todocapstone
//
//  Created by hufsaim on 2023/06/03.
//

import SwiftUI
import Combine
import Foundation

struct test2: View {
    
    @EnvironmentObject var data : Dataexample
    
    var body: some View {
        Text("\(data.text) : \(data.counter) ")
    }
}

struct test2_Previews: PreviewProvider {
    static var previews: some View {
        test2()
            .environmentObject(Dataexample())
    }
}
