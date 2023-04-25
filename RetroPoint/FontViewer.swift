//
//  TheEndView.swift
//  RetroPoint
//
//  Created by Andre Trettin on 24/4/2566 BE.
//

import SwiftUI

struct TextScrollViewModel: Identifiable {
    let id: Int
    let text: String
}

struct FontViewer: View {
    @ObservedObject var store: TheEndStore
    let text: String
    let index: Int

    @State private var scale = 1

    @State private var colorStart = Color.yellow
    @State private var colorB = Color.random
    @State private var colorMiddle = Color.blue
    @State private var colorC = Color.random
    @State private var colorEnd = Color.green

    var body: some View {
        VStack(spacing: 20) {
            Text(text)
                .scaledFont(size: 32, weight: .heavy, design: .monospaced)
                .multilineTextAlignment(.center)
                .foregroundStyle(
                    LinearGradient(colors: [colorStart, colorB, colorMiddle, colorC, colorEnd], startPoint: .leading, endPoint: .trailing)
                )
                .shadow(color: .blue, radius: 32)
                .shadow(color: .red, radius: 32)
                .shadow(color: .blue, radius: 32)
        }
        .environment(\.fontScaleFactor, (store.index - 1) == index ? scale : 1)
        .onAppear {
            withAnimation(.easeInOut(duration: 2).delay(0.3)) { scale = 3 }
            withAnimation(.linear(duration: 0.1).repeatForever()) {
                let start = colorStart
                colorStart = colorEnd
                colorEnd = start
                let b = colorB
                colorB = colorC
                colorC = b
                colorMiddle = Color.random
            }
        }
    }
}

struct FontViewer_Previews: PreviewProvider {
    static var previews: some View {
        FontViewer(store: TheEndStore(), text: "RetroVision", index: 0)
            .frame(minWidth: 600, minHeight: 400)
    }
}
