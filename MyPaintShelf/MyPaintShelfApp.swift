//
//  MyPaintShelfApp.swift
//  MyPaintShelf
//
//  Created by Dennis Mayfield on 3/1/23.
//

import SwiftUI

@main
struct MyPaintShelfApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
