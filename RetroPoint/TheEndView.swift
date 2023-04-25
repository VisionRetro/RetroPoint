//
//  TheEndView.swift
//  RetroPoint
//
//  Created by Andre Trettin on 25/4/2566 BE.
//

import AVFoundation
import SwiftUI

final class TheEndStore: ObservableObject {
    @Published var outro: [TextScrollViewModel] = []

    var final = [
        "VisionRetro",
        "presents",
        "RetroPoint",
        "Support of AI",
        "The Slide App",
        "------------",
        "Greetings to",
        "ADS Picass0",
        "BAD EXEC",
        "pp App",
        "PS-2023-Q2-S1",
        "Amiga A4ooo",
        "0xDEADBEEF",
        "Guru Meditation",
        "นิด",
        "hackingwithswift.com",
        "kavsoft",
        "Agoda",
        "!YOU!",
        "************",
        "In this production",
        "No Computer were harmed",
        "Thank you",
        "github.com/VisionRetro",
        "THE END"
    ]

    var index = 0
    var loopCounter = 0

    var aX: CGFloat = -150
    var aY: CGFloat = -100

    var mX: CGFloat = 150
    var mY: CGFloat = -100

    var playerLooper: AVPlayerLooper?
    var queuePlayer: AVQueuePlayer?

    func start() {
        guard playerLooper == nil else { return }
        let file = Bundle.main.url(forResource: "RetroSound", withExtension: "m4a")

        let asset: AVAsset = AVAsset(url: file!)

        let playerItem = AVPlayerItem(asset: asset)
        self.queuePlayer = AVQueuePlayer(playerItem: playerItem)
        self.playerLooper = AVPlayerLooper(player: self.queuePlayer! , templateItem: playerItem)
        self.queuePlayer?.play()
    }

    func change(for size: CGSize) {
        let hW = (size.width - 150) / 2
        let hH = (size.height - 100) / 2

        let negA = Int.random(in: 0...1) == 1 ? -1.0 : 1.0
        let negM = Int.random(in: 0...1) == 1 ? -1.0 : 1.0
        aX = -1 * Double.random(in: 150...hW)
        aY = negA * Double.random(in: 100...hH)
        mX = Double.random(in: 150...hW)
        mY = negM * Double.random(in: 100...hH)

        // size
        guard index < final.count else {
//            loopCounter += 1
//            if loopCounter > 3 {
//                outro = []
//                index = 0
//                loopCounter = 0
//            }
            return
        }
        let model = TextScrollViewModel(id: index, text: final[index])
        outro.append(model)
        index += 1
    }
}


struct TheEndView: View {
    let store = TheEndStore()

    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        GeometryReader { proxy in
            TimelineView(.animation) { timeline in
                ZStack(alignment: .center) {
                    Color.black

                    RadialGradient(colors: [.red.opacity(0.6), .black], center: UnitPoint(x: (proxy.size.width - store.mX) / proxy.size.width, y: abs(store.mY) / proxy.size.height), startRadius: 0, endRadius: 300)
                        .shadow(color: .white.opacity(0.3), radius: 32)

                    MorphingDevView(name: "Andre")
                        .frame(width: 200, height: 200)
                        .offset(x: store.aX, y: store.aY)

                    MorphingDevView(name: "Michael")
                        .frame(width: 200, height: 200)
                        .offset(x: store.mX, y: store.mY)

                    ForEach(store.outro) { model in
                        FontViewer(store: store, text: model.text, index: model.id)
                            .offset(x: 0, y: CGFloat((store.outro.count - 2) - model.id) * -100.0)
                    }
                }
            }
            .onReceive(timer) { time in
                withAnimation { store.change(for: proxy.size) }
            }
            .onAppear { store.start() }
        }
    }
}


struct TheEndView_Previews: PreviewProvider {
    static var previews: some View {
        TheEndView()
    }
}
