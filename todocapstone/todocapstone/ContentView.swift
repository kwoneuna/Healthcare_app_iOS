//
//  ContentView.swift
//  todocapstone
//
//  Created by hufsaim on 2023/04/28.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var userInfo = UserInfo()
    @State var isContentReady : Bool = false
    @State var  isFirstLaunching : Bool = true
    
   
    
    var body: some View {
            
        
        TabView{
            main_screen(userInfo: UserInfo())
                .tabItem {
                    Image(systemName: "checkmark.seal")
                    Text("Main")
                }
            avartar()
                .tabItem({
                    Image(systemName: "person")
                    Text("Avartar")
                })
            Setting(userInfo: UserInfo())
                .tabItem {
                    Image(systemName: "house")
                    Text("Setting")
                }
            
        }.fullScreenCover(isPresented: $isFirstLaunching) {
            PersonalInfoView(isFirstLaunching : $isFirstLaunching, userInfo: UserInfo())
        }
       
            
        
    }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
