////
//  LoadingView.swift
//  todocapstone
//
//  Created by hufsaim on 2023/05/10.
//
import Combine
import SwiftUI

struct LoadingView: View {
    @Binding var isFirstLaunching : Bool
    var body: some View {
        
        Button{
            isFirstLaunching.toggle()
        } label :{
            Text("시작하기")
        }
    }
}
//struct LoadingView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoadingView(isFirstLaunching: false)
//    }
//}
