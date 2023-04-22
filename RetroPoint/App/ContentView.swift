//
//  ContentView.swift
//  RetroPoint
//
//  Created by Michael Santoso on 18/4/2566 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var scale = 1

    var body: some View {
        SlideView(slides: slides)
            .environment(\.fontScaleFactor, scale)
            .onAppear {
                withAnimation(.spring().delay(0.5)) { scale = 3}
            }
    }
}
