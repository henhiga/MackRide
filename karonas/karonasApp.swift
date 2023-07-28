//
//  karonasApp.swift
//  karonas
//
//  Created by Henrique on 24/07/23.
//

import SwiftUI
import UserNotifications

@main
struct karonasApp: App {
    @StateObject private var dataController = DataController()
    let center = UNUserNotificationCenter.current()
            
            init() {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("autorizado!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
