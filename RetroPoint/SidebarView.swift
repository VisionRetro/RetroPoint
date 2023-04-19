//
//  SidebarView.swift
//  RetroPoint
//
//  Created by Michael Santoso on 18/4/2566 BE.
//

import SwiftUI

enum SidebarItem: String, CaseIterable, Identifiable {
    case newPresentation
    case templates
    case savedPresentations

    var id: String { self.rawValue }

    var label: String {
        switch self {
        case .newPresentation:
            return "New Presentation"
        case .templates:
            return "Templates"
        case .savedPresentations:
            return "Saved Presentations"
        }
    }
}

struct Sidebar: View {
    @State private var selectedItem: SidebarItem?

    var body: some View {
        List(SidebarItem.allCases, id: \.self, selection: $selectedItem) { item in
            NavigationLink(
                destination: destinationView(for: item),
                tag: item,
                selection: $selectedItem
            ) {
                Label(item.label, systemImage: item.rawValue)
            }
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Presentations")
    }

    @ViewBuilder
    private func destinationView(for item: SidebarItem) -> some View {
        switch item {
        case .newPresentation:
            NewPresentationView()
        case .templates:
            Text("Templates")
        case .savedPresentations:
            Text("Saved Presentations")
        }
    }
}
