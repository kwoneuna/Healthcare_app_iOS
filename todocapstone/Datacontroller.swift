//
//  Datacontroller.swift
//  todocapstone
//
//  Created by hufsaim on 2023/06/06.
//

import Foundation
import CoreData

import CoreData
import Foundation

class DataController: ObservableObject {
    //dataloading
    let container = NSPersistentContainer(name: "Data")
    init() {
        container.loadPersistentStores{
            description, error in
            if let error = error {
                print("Core Data failed to load : \(error.localizedDescription)")
            }
        }
    }
}

