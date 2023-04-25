//
//  RetroPointApp.swift
//  RetroPoint
//
//  Created by Michael Santoso on 18/4/2566 BE.
//

import SwiftUI

final class AppStore: ObservableObject {
    @Published var isEnd = false
}

@main
struct RetroPointApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var store = AppStore()

    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .commands {
            AppCommand(store: store)
        }

    }
}

struct AppCommand: Commands {
    let store: AppStore

    var body: some Commands {
        CommandMenu("The End") {
            Button("Show End Demo", action: {
                store.isEnd.toggle()
            })
            .keyboardShortcut("e")
        }
    }
}

