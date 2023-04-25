//
//  ContentView.swift
//  RetroPoint
//
//  Created by Michael Santoso on 18/4/2566 BE.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: AppStore

    @State private var scale = 1
    @State private var slideIndex = 0

    var body: some View {
        if store.state == .end  {
            TheEndView()
        } else if store.state == .reallyEnd {
            Image("Slido")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        } else {
            SlideView(slides: slideData, slideIndex: $slideIndex)
                .frame(minWidth: 1000, minHeight: 720)
                .modifier(SlideFooterViewModifier())
                .environment(\.fontScaleFactor, scale)
                .onAppear {
                    withAnimation(.spring().delay(0.5)) { scale = 3}
                }
                .id(slideIndex)
        }
    }
}

struct SlideFooterViewModifier: ViewModifier {
    @State private var photoSize: CGFloat = 44.0
    func body(content: Content) -> some View {
        content
            .safeAreaInset(edge: .bottom) {
                HStack {
                    Image("Michael")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: photoSize, height: photoSize)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .frame(width: 64, height: 64)

                    Text("Michael").font(.title).fontWeight(.bold)

                    Spacer()
                    VStack {
                        Text("Agoda Tech Talk 2023")
                        Text("RetroVision")
                    }
                    .font(.headline)
                    Spacer()

                    Text("Andre").font(.title).fontWeight(.bold)

                    Image("Andre")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: photoSize, height: photoSize)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .frame(width: 64, height: 64)
                }
                .padding(8)
                .background(RoundedRectangle(cornerRadius: 16).fill(.blue.opacity(0.8)))
                .padding(2)
                .background(RoundedRectangle(cornerRadius: 16).fill(.white.opacity(0.8)))

                .ignoresSafeArea()
            }
            .onAppear {
                withAnimation(.interactiveSpring().delay(0.75).repeatCount(5)) { photoSize = 64 }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: AppStore())
    }
}
