//
//  ShaykiApp.swift
//  Shayki
//
//  Created by sumaiya on 01/12/2566 BE.
//

import SwiftUI
import AppIntents


// MeditationService.swift
//here I need to difine a function

class ReminderService {
    static func startDefaultSession() async {
        // Your implementation here
    }
}

struct StartAppIntent: AppIntent {
    static let title: LocalizedStringResource = "Oil check"
    
    static var isVisible = true

//    func perform() async throws -> some IntentResult & ProvidesDialog {
//        await MeditationService.startDefaultSession()
//        return .result(dialog: "Okay, starting a meditation session.")
    //}
    func perform() async throws -> some ProvidesDialog & ShowsSnippetView {
        await ReminderService.startDefaultSession()

        return .result(
            dialog: "Okay, Here is the oil check.",
            view: Dialog()
        )
    }
    
    
    
}


struct MeditationShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {

        
    
            AppShortcut(intent:StartAppIntent(),
                        phrases: ["Oil Check in \(.applicationName)",
                                  "Begin \(.applicationName)",
                                "Meditate with \(.applicationName)",
                    
                                 
                                 ],
                        shortTitle: "Complete Task",
                        systemImageName: "checkmark")
        
        
    }
}



@main
struct ShaykiApp: App {
    

    //notification
    private var delegate: NotificationDelegate = NotificationDelegate()
           
           init() {
               let center = UNUserNotificationCenter.current()
               center.delegate = delegate
               center.requestAuthorization (options: [.alert, .sound, .badge]) { result, error in
                   if let error = error {
                       print(error)
                   }
               }
           }
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
            LocalNotifications()
        }
    }
}
