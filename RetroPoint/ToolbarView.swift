//
//  ToolbarView.swift
//  RetroPoint
//
//  Created by Michael Santoso on 18/4/2566 BE.
//

import SwiftUI

struct ToolbarView: View {
    @State private var showInspector = true

    var body: some View {
        HStack {
            Button(action: addSlide) {
                Label("Add Slide", systemImage: "plus")
            }
            .help("Add a new slide")

            Button(action: deleteSlide) {
                Label("Delete Slide", systemImage: "minus")
            }
            .help("Delete the current slide")

            Button(action: duplicateSlide) {
                Label("Duplicate Slide", systemImage: "doc.on.doc")
            }
            .help("Duplicate the current slide")

            Spacer()

            Button(action: toggleInspector) {
                Label("Toggle Inspector", systemImage: showInspector ? "sidebar.right" : "sidebar.right.fill")
            }
            .help("Toggle the Inspector view")
        }
    }

    private func addSlide() {
        // Your implementation for adding a new slide goes here
    }

    private func deleteSlide() {
        // Your implementation for deleting the current slide goes here
    }

    private func duplicateSlide() {
        // Your implementation for duplicating the current slide goes here
    }

    private func toggleInspector() {
        showInspector.toggle()
        // Your implementation for toggling the inspector view goes here
    }
}
