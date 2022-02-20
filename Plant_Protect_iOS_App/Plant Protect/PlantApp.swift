//
//  PlantApp.swift
//  Plant
//
//  Created by Sanchitha Dinesh on 2/19/22.
//

import SwiftUI

@main
struct PlantApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
