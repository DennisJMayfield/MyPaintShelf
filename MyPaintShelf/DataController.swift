//
//  DataController.swift
//  MyPaintShelf
//
//  Created by Dennis Mayfield on 3/13/23.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "MyPaintShelf")
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
