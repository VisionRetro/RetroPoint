//
//  SlideView.swift
//  Why should I use SwiftUI?
//
//  Created by Andre Trettin on 19/4/2566 BE.
//

import SwiftUI

struct SlideViewModel {
    let title: String
    let bulletPoints: [String]
}

let slides = [
    SlideViewModel(title: "Why should I use SwiftUI?", bulletPoints: [
        "It's easy to use",
        "It's declarative",
        "It's cross platform",
        "It's reactive",
        "It's fast",
        "It's fun"
    ]),
]

struct SlideView: View {
    let slideViewModel: SlideViewModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(slideViewModel.title)
                    .scaledFont(size: 20, weight: .bold)
                    .foregroundColor(.white)
            }
            .padding(.vertical, 32)
            .frame(maxWidth: .infinity, alignment: .center)

            VStack(alignment: .leading) {
                ForEach(slideViewModel.bulletPoints, id: \.self) { point in
                    HStack {
                        Image(systemName: "circle.fill")
                            .imageScale(.small)
                            .font(.callout)

                        Text(point)
                            .scaledFont(size: 12, weight: .bold)
                    }
                    .padding(.bottom, 16)
                    .foregroundColor(.white)
                }
            }
            .padding(64)
            Spacer()

        }
        .padding(50)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
}

struct SlideView_Previews: PreviewProvider {
    static var previews: some View {
        SlideView(slideViewModel: slides[0])
            .environment(\.fontScaleFactor, 1)
    }
}
