//
//  ContentView.swift
//  todocapstone
//
//  Created by hufsaim on 2023/04/28.
//

import SwiftUI

struct ContentView: View {
    //@State var isContentReady : Bool = false
    var body: some View {
        TabView{
            main_screen()
                .tabItem {
                    Image(systemName: "checkmark.seal")
                    Text("Main")
                }
            avartar()
                .tabItem({
                    Image(systemName: "person")
                    Text("아바타")
                })
            
        }
        
      
        
    }
  
}
//mark : 스플래시 스크린
extension ContentView{
    var mySplashScreenView: some View{
        Color.yellow.ignoresSafeArea(.all)
            .overlay(alignment: .center) {
                Text("스플래쉬")
                    .font(.largeTitle)
            }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
