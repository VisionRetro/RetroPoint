//
//  SomeCode.swift
//  RetroPoint
//
//  Created by Andre Trettin on 24/4/2566 BE.
//

import SwiftUI


final class MapStore: ObservableObject {
    @Published var map: String

    init(map: String) {
        self.map = map
    }
}

final class PhotoStore: ObservableObject {
    @Published var photo: String

    init(photo: String) {
        self.photo = photo
    }
}


struct TabRootView: View {
    var body: some View {
        TabView {
            VStack {}
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
            VStack {}
                .tabItem {
                    Image(systemName: "photo")
                    Text("Photo")
                }

        }
    }
}


struct FancyButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(40)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct RetroButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(40)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}


struct FancyButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {}) {
            Text("Hello World")
        }
        .buttonStyle(FancyButtonStyle())
    }
}

