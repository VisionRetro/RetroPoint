//
//  MorphingDevView.swift
//  RetroPoint
//
//  Created by Andre Trettin on 25/4/2566 BE.
//

import SwiftUI

enum OurSymbols: String, Equatable, Hashable, CaseIterable {
    case personFill = "person.fill"
    case personCircleFill = "person.circle.fill"
    case personBadgePlusFill = "person.badge.plus.fill"
    case personBadgeMinusFill = "person.badge.minus.fill"
    case person2Fill = "person.2.fill"
    case personCropCircleFill = "person.crop.circle.fill"
    case personCropCircleBadgePlusFill = "person.crop.circle.badge.plus.fill"
    case personCropCircleBadgeMinusFill = "person.crop.circle.badge.minus.fill"
    case personCropCircleBadgeCheckmarkFill = "person.crop.circle.badge.checkmark.fill"
    case personCropCircleBadgeXmarkFill = "person.crop.circle.badge.xmark.fill"
    case personCropCircleBadgeQuestionmarkFill = "person.crop.circle.badge.questionmark.fill"
    case personCropCircleBadgeExclamFill = "person.crop.circle.badge.exclam.fill"
    case personCropSquareFill = "person.crop.square.fill"
    case eyeFill = "eye.fill"
    case eyeSlashFill = "eye.slash.fill"
    case eyes = "eyes"
    case eyesInverse = "eyes.inverse"
    case eyebrow = "eyebrow"
    case noseFill = "nose.fill"
    case mustacheFill = "mustache.fill"
    case mouth = "mouth"
}

final class MorphingStore: ObservableObject {
    @Published var current: OurSymbols = .mouth
    @Published var blur: Double = 10

    init() {
        change()
    }

    func change() {
        current = OurSymbols.allCases.randomElement() ?? .person2Fill
    }
}


struct MorphingDevView: View {
    let name: String
    @StateObject private var store = MorphingStore()

    var body: some View {
        VStack {
            GeometryReader { proxy in
                Image(name)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .offset(x: 0, y: 50)
                    .clipped()
                    .overlay {
                        Rectangle()
                            .fill(.white)
                            .opacity(0)
                    }
                    .mask {
                        Canvas { context, size in
                            context.addFilter(.alphaThreshold(min: 0.5))
                            context.addFilter(.blur(radius: store.blur >= 20 ? 20 - (store.blur - 20) : store.blur))
                            if let aImage = context.resolveSymbol(id: 1) {
                                context.draw(aImage, at: CGPoint(x: size.width / 2, y: size.height / 2), anchor: .center)
                            }
                        } symbols: {
                            ResolvedHeadView(currentImage: $store.current)
                                .tag(1)
                        }
                        .onReceive(Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()) { _ in
                            if store.blur <= 40 {
                                store.blur += 0.5
                                if store.blur.rounded() == 20 {
                                    store.change()
                                }
                            } else {
                                store.blur = 0
                            }
                        }
                    }
            }
            .frame(height: 250)
        }
    }
}

struct ResolvedHeadView: View {
    @Binding var currentImage: OurSymbols
    var body: some View {
        Image(systemName: currentImage.rawValue)
            .font(.system(size: 200))
            .frame(width: 300, height: 300)
    }
}

struct MorphingDevView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MorphingDevView(name: "Andre")
                .frame(width: 400, height: 400)
            MorphingDevView(name: "Michael")
                .frame(width: 400, height: 400)
        }
        .preferredColorScheme(.dark)
    }
}
