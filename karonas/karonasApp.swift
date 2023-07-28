//
//  karonasApp.swift
//  karonas
//
//  Created by Henrique on 24/07/23.
//

import SwiftUI

@main
struct karonasApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
