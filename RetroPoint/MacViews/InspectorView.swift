//
//  InspectorView.swift
//  RetroPoint
//
//  Created by Michael Santoso on 18/4/2566 BE.
//

import SwiftUI

struct InspectorView: View {
    @State private var selectedTab: InspectorTab = .textFormatting

    var body: some View {
        VStack {
            Picker("Inspector", selection: $selectedTab) {
                ForEach(InspectorTab.allCases) { tab in
                    Text(tab.label).tag(tab)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)

            content(for: selectedTab)
        }
        .frame(width: 300)
        .padding()
    }

    @ViewBuilder
    private func content(for tab: InspectorTab) -> some View {
        switch tab {
        case .textFormatting:
            TextFormattingView()
        case .slideLayout:
            SlideLayoutView()
        case .transitions:
            TransitionsView()
        }
    }
}

enum InspectorTab: String, CaseIterable, Identifiable {
    case textFormatting
    case slideLayout
    case transitions

    var id: String { self.rawValue }

    var label: String {
        switch self {
        case .textFormatting:
            return "Text Formatting"
        case .slideLayout:
            return "Slide Layout"
        case .transitions:
            return "Transitions"
        }
    }
}

struct TextFormattingView: View {
    var body: some View {
        VStack {
            // Your implementation for text formatting properties goes here
            Text("Text Formatting")
        }
    }
}

struct SlideLayoutView: View {
    var body: some View {
        VStack {
            // Your implementation for slide layout properties goes here
            Text("Slide Layout")
        }
    }
}

struct TransitionsView: View {
    var body: some View {
        VStack {
            // Your implementation for slide transitions properties goes here
            Text("Transitions")
        }
    }
}

struct InspectorView_Previews: PreviewProvider {
    static var previews: some View {
        InspectorView()
    }
}
