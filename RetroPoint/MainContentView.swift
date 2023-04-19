//
//  MainContentView.swift
//  RetroPoint
//
//  Created by Michael Santoso on 18/4/2566 BE.
//

import SwiftUI

enum MainContentTab: String, CaseIterable, Identifiable {
    case slideEditor
    case slideSorter
    case presentationMode

    var id: String { self.rawValue }

    var label: String {
        switch self {
        case .slideEditor:
            return "Slide Editor"
        case .slideSorter:
            return "Slide Sorter"
        case .presentationMode:
            return "Presentation Mode"
        }
    }
}

struct MainContentView: View {
    @State private var selectedTab: MainContentTab = .slideEditor

    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(MainContentTab.allCases) { tab in
                content(for: tab)
                    .tabItem {
                        Label(tab.label, systemImage: tab.rawValue)
                    }
                    .tag(tab)
            }
        }
        .padding()
    }

    @ViewBuilder
    private func content(for tab: MainContentTab) -> some View {
        switch tab {
        case .slideEditor:
            SlideEditorView()
        case .slideSorter:
            SlideSorterView()
        case .presentationMode:
            PresentationModeView()
        }
    }
}

struct SlideEditorView: View {
    var body: some View {
        Text("Slide Editor")
    }
}

struct SlideSorterView: View {
    var body: some View {
        Text("Slide Sorter")
    }
}

struct PresentationModeView: View {
    var body: some View {
        Text("Presentation Mode")
    }
}
