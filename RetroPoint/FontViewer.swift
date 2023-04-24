//
//  TheEndView.swift
//  RetroPoint
//
//  Created by Andre Trettin on 24/4/2566 BE.
//

import SwiftUI

final class TheEndStore {
    @Published var outro: [String] = []

    var final = [
        "RetroVision",
        "presents",
        "RetroPoint",
        "an AI generated Slide app"
    ]

    var index = 0

    func change() {
        guard index < final.count else { return }
        outro.append(final[index])
        index += 1
    }
}

struct FontScrollView: View {
    let store = TheEndStore()

    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()


    var body: some View {
        TimelineView(.animation) { timeline in
            VStack {
                ForEach(store.outro, id: \.self) { text in
                    FontViewer(text: text)
                }
            }
        }
        .onReceive(timer) { time in
            store.change()
        }
    }
}

struct FontViewer: View {
    let text: String

    @State private var scale = 1

    @State private var colorStart = Color.yellow
    @State private var colorB = Color.random
    @State private var colorMiddle = Color.blue
    @State private var colorC = Color.random
    @State private var colorEnd = Color.green

    var body: some View {
        VStack(spacing: 20) {
            LinearGradient(colors: [colorStart, colorB, colorMiddle, colorC, colorEnd], startPoint: .leading, endPoint: .trailing)
                .mask {
                    Text(text)
                        .scaledFont(size: 32, weight: .heavy, design: .monospaced)

                }
                .shadow(color: .blue, radius: 32)
                .shadow(color: .red, radius: 32)
                .shadow(color: .blue, radius: 32)
        }

        .environment(\.fontScaleFactor, scale)
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

struct TheEndView_Previews: PreviewProvider {
    static var previews: some View {
//        FontViewer(text: "RetroVision")
        FontScrollView()
            .frame(minWidth: 600, minHeight: 400)
    }
}
