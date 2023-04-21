//
//  SlideView.swift
//  Why should I use SwiftUI?
//
//  Created by Andre Trettin on 19/4/2566 BE.
//

import SwiftUI

enum SlideType {
    case bulletPoint
    case bulletPointImage
}

struct SlideViewModel {
    let title: String
    let bulletPoints: [String]
    var slideType: SlideType = .bulletPoint
    var image: URL?
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
    SlideViewModel(title: "Benefits of using ChatGPT for MVP Development?", bulletPoints: [
        "Faster prototyping",
        "Improved user engagement",
        "Reduced development costs",
        "Better scalability",
        "Improved accuracy"
    ]),
    SlideViewModel(title: "Faster prototyping", bulletPoints: [
        "No need manually checking each response, ChatGPT can help to compare our MVP output with ChatGPT output for better accuracy (i.e. grammar spelling, language correctness, etc)",
        "Using advanced Natural Language Processing",
        "Reduced development costs",
        "Better scalability",
        "Improved accuracy"
    ]),
    SlideViewModel(title: "Improved User Engagement", bulletPoints: [
        "Interactive response",
        "Record history of conversation",
        "Reduced development costs",
        "Better scalability",
        "Improved accuracy"
    ]),
    SlideViewModel(title: "Reduced development costs", bulletPoints: [
        "Personal Assistants",
        "Help with the tedious task",
    ]),
    SlideViewModel(title: "Better scalability", bulletPoints: [
        ""
    ]),
    SlideViewModel(title: "Improved accuracy", bulletPoints: [
        ""
    ]),
    SlideViewModel(title: "Make the best out of ChatGPT", bulletPoints: [
        "Construct good input prompt and train the AI to make them learn to make best response",
        "Give some rules related to the output inside input prompt",
        "Connect output with your internal data"
    ]),
    SlideViewModel(title: "Title", bulletPoints: [
        "Nice Image",
        "Nice Image 2",
    ], slideType: .bulletPointImage, image: URL(string: "https://scontent.fbkk2-4.fna.fbcdn.net/v/t39.30808-6/341519370_711205544081347_5941551301377156390_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=9267fe&_nc_ohc=dEXJsCWCjTQAX_bNIiU&_nc_ht=scontent.fbkk2-4.fna&oh=00_AfDqBV7vRs9WlqlhaEL6t65cJuhiBoevX7vr7jXT5Fi02g&oe=64465776"))
]

struct SlideView: View {
    let slideViewModel: SlideViewModel

    var bulletPointSlideView: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(slideViewModel.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                .foregroundColor(.white)
            }
            .padding(.vertical, 32)
            .frame(maxWidth: .infinity, alignment: .center)

            Spacer()

            VStack(alignment: .leading) {
                ForEach(slideViewModel.bulletPoints, id: \.self) { point in
                    HStack {
                        Image(systemName: "circle.fill")
                            .imageScale(.small)
                            .font(.callout)

                        Text(point)
                            .font(.title)
                    }
                    .padding(.bottom, 16)
                    .foregroundColor(.white)
                }
            }
            .padding(.bottom, 32)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }

    var bulletPointImageSlideView: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(slideViewModel.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                .foregroundColor(.white)
            }
            .padding(.vertical, 32)
            .frame(maxWidth: .infinity, alignment: .center)

            Spacer()

            HStack {
                VStack(alignment: .leading) {
                    ForEach(slideViewModel.bulletPoints, id: \.self) { point in
                        HStack {
                            Image(systemName: "circle.fill")
                                .imageScale(.small)
                                .font(.callout)

                            Text(point)
                                .font(.title)
                        }
                        .padding(.bottom, 16)
                        .foregroundColor(.white)
                    }
                }
                .padding(.bottom, 32)
                AsyncImage(url: slideViewModel.image)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }

    var body: some View {
        if slideViewModel.slideType == .bulletPoint {
            bulletPointSlideView
        } else {
            bulletPointImageSlideView
        }
    }
}

struct SlideView_Previews: PreviewProvider {
    static var previews: some View {
        SlideView(slideViewModel: slides[slides.count - 1])
    }
}
