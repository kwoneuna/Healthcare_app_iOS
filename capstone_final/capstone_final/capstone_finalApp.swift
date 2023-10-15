//
//  capstone_finalApp.swift
//  capstone_final
//
//  Created by 박민정 on 2023/07/22.
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
