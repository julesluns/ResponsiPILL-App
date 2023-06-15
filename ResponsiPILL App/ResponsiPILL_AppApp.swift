//
//  ResponsiPILL_AppApp.swift
//  ResponsiPILL App
//
//  Created by Julia Luna on 6/14/23.
//

import SwiftUI

@main
struct ResponsiPILL_AppApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
