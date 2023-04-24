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

final class TheEndStore: ObservableObject {
    @Published var outro: [TextScrollViewModel] = []

    var final = [
        "RetroVision",
        "presents",
        "RetroPoint",
        "Support of AI",
        "Slide App",
        "Greetings to",
        "ADS Picasso",
        "PP App",
        "Agoda",
        "!YOU!",
        "Thank you",
        "THE END"
    ]

    var index = 0

    func change() {
        guard index < final.count else { return }
        let model = TextScrollViewModel(id: index, text: final[index])
        outro.append(model)
        index += 1
    }
}

struct FontScrollView: View {
    let store = TheEndStore()

    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        TimelineView(.animation) { timeline in
            ZStack {
                Color.black

                RadialGradient(colors: [.blue.opacity(0.6), .black], center: UnitPoint(x: 0.1, y: 0.2), startRadius: 0, endRadius: 300)
                    .shadow(color: .white.opacity(0.3), radius: 32)

                ForEach(store.outro) { model in
                    FontViewer(store: store, text: model.text, index: model.index)
                        .offset(x: 0, y: CGFloat((store.outro.count - 2) - model.id) * -100.0)
                }
            }
        }
        .onReceive(timer) { time in
            withAnimation { store.change() }
        }
    }
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
            LinearGradient(colors: [colorStart, colorB, colorMiddle, colorC, colorEnd], startPoint: .leading, endPoint: .trailing)
                .mask {
                    Text(text)
                        .scaledFont(size: 32, weight: .heavy, design: .monospaced)

                }
                .shadow(color: .blue, radius: 32)
                .shadow(color: .red, radius: 32)
                .shadow(color: .blue, radius: 32)
        }
        .environment(\.fontScaleFactor, store.index == index ? scale : 1)
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
