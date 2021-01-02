//
//  CountdownsApp.swift
//  Countdowns
//
//  Created by Kyle Edwards on 01/01/2021.
//

import SwiftUI
import CoreData

@main
struct CountdownsApp: App {
    
    let persistanceContainer = PersistanceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistanceContainer.container.viewContext)
        }
    }
    
    
}
