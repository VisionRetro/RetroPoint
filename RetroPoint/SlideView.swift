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

    static let `default` = SlideViewModel(title: "", bulletPoints: [])
}

let slideData = [
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
        "Using advanced Natural Language Processing"
    ]),
    SlideViewModel(title: "Improved User Engagement", bulletPoints: [
        "Interactive response",
        "Personalized response based on input",
        "Record history of conversation"
    ]),
    SlideViewModel(title: "Reduced development costs", bulletPoints: [
        "Personal Assistants (copywriting, marketing, product, etc)",
        "Help with the tedious task (i.e. generating mock data, content outlines, ideas)",
        "Automating most-time consuming tasks (i.e. FAQ)",
        "Help to find and identify root cause of a bug"
    ]),
    SlideViewModel(title: "Better scalability", bulletPoints: [
        "Generating summarizes in large numbers / volume in real time (Aggregator MVP)",
        "Identifying security logs as potential to cyber attacks and provide recommendations"
    ]),
    SlideViewModel(title: "Improved accuracy", bulletPoints: [
        "Generating more precise and accurate results based on user input",
        "Medical diagnosis MVP Product (input patient symptoms product can generate list of potential diagnoses along with recommended tests and treatments)",
        "Combined the result with internal database or doctor's experience / knowledge"
    ]),
    SlideViewModel(title: "Make the best out of ChatGPT", bulletPoints: [
        "Make the AI as personal assistants",
        "Construct good input prompt and train the AI to make them learn to make suitable and accurate response",
        "Give some rules related to the output inside input prompt",
        "Learn how to parse string to your expected format",
        "Connect output with your internal data"
    ]),
    SlideViewModel(title: "Slide with Image", bulletPoints: [
        "Support Images",
        "Async Loading",
        "Scaling"
    ], slideType: .bulletPointImage, image: URL(string: "https://scontent.fbkk2-4.fna.fbcdn.net/v/t39.30808-6/341519370_711205544081347_5941551301377156390_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=9267fe&_nc_ohc=dEXJsCWCjTQAX_bNIiU&_nc_ht=scontent.fbkk2-4.fna&oh=00_AfDqBV7vRs9WlqlhaEL6t65cJuhiBoevX7vr7jXT5Fi02g&oe=64465776"))
]

struct SlideView: View {
    let slides: [SlideViewModel]
    @Binding var slideIndex: Int

    @State private var currentSlide: SlideViewModel = slideData[slideData.count - 1]

    var body: some View {
        ZStack {
            HStack {
                VStack {
                    Color.clear
                    Button("Prev") {
                        slideIndex -= 1
                    }
                    .foregroundColor(.clear)
                    .keyboardShortcut(.leftArrow, modifiers: [.command])
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    slideIndex -= 1
                }
                .disabled(slideIndex < 1)

                VStack {
                    Color.clear
                    Button("Next") {
                        slideIndex += 1
                    }
                    .foregroundColor(.clear)
                    .keyboardShortcut(.rightArrow, modifiers: [.command])
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    slideIndex += 1
                }
                .disabled(slideIndex >= slides.count - 1)
            }
            .buttonStyle(.borderless)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)

            SlideContentView(slideViewModel: $currentSlide)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onChange(of: slideIndex) { newValue in
            withAnimation(.interactiveSpring()) {
                currentSlide = slides[newValue]
            }
        }
        .onAppear {
            currentSlide = slides[slideIndex]
        }
    }
}

struct SlideContentView: View {
    @Binding var slideViewModel: SlideViewModel

    var bulletPointSlideView: some View {
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

    var bulletPointImageSlideView: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(slideViewModel.title)
                    .scaledFont(size: 20, weight: .bold)
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
                                .scaledFont(size: 12, weight: .bold)
                        }
                        .padding(.bottom, 16)
                        .foregroundColor(.white)
                    }
                    Spacer()
                }
                .padding(64)

                Spacer()

                AsyncImage(url: slideViewModel.image) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    VStack(spacing: 20) {
                        Text("Loading the image")
                            .scaledFont(size: 20)
                        ProgressView()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                }
                .padding(20)
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
        SlideView(slides: [slideData[slideData.count - 1]], slideIndex: .constant(0))
            .environment(\.fontScaleFactor, 1)
    }
}
