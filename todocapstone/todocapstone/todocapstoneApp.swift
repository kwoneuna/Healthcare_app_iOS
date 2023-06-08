//
//  todocapstoneApp.swift
//  todocapstone
//
//  Created by hufsaim on 2023/04/28.
//

import SwiftUI

@main
struct todocapstoneApp: App {
    @StateObject private var userInfo = UserInfo()
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,dataController.container.viewContext)

        }
    }
}
