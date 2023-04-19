//
//  ContentView.swift
//  RetroPoint
//
//  Created by Michael Santoso on 18/4/2566 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Sidebar()

            MainContentView()
                .toolbar {
                    ToolbarView()
                }

            InspectorView()
        }
    }
}
