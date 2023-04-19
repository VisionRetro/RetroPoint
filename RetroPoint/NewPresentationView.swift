//
//  NewPresentationView.swift
//  RetroPoint
//
//  Created by Michael Santoso on 18/4/2566 BE.
//

import SwiftUI
import AppKit

struct Presentation: Identifiable {
    let id: UUID
    let title: String
    let createdAt: Date
    let slides: [Slide]
}

struct Slide: Identifiable {
    let id: UUID
    var image: NSImage?
}

struct NewPresentationView: View {
    @State private var presentationTitle: String = ""
    @State private var slides: [Slide] = []
    @State private var selectedSlideIndex: Int?

    // This is the in-memory cache to store the presentations
    @State private var presentations: [Presentation] = []

    var body: some View {
        VStack {
            TextField("Enter presentation title", text: $presentationTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SlideListView(slides: $slides, selectedSlideIndex: $selectedSlideIndex)

            HStack {
                Button(action: addSlide) {
                    Label("Add Slide", systemImage: "plus")
                }
                .padding()

                Button(action: {
                    guard let index = selectedSlideIndex else { return }
                    slides[index].image = nil
                }) {
                    Label("Remove Image", systemImage: "trash")
                }
                .padding()
                .disabled(selectedSlideIndex == nil)

                Button(action: savePresentation) {
                    Text("Save Presentation")
                }
                .padding()
                .disabled(presentationTitle.isEmpty || slides.isEmpty)
            }

            if let index = selectedSlideIndex {
                SlideInspectorView(slide: $slides[index])
            }
        }
    }

    private func addSlide() {
        let slide = Slide(id: UUID(), image: nil)
        slides.append(slide)
        selectedSlideIndex = slides.count - 1
    }

    private func savePresentation() {
        let newPresentation = Presentation(id: UUID(), title: presentationTitle, createdAt: Date(), slides: slides)
        presentations.append(newPresentation)
        // Handle the saved presentation as needed (e.g., navigate back to the main screen)
    }
}

struct SlideListView: View {
    @Binding var slides: [Slide]
    @Binding var selectedSlideIndex: Int?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack {
                ForEach(slides.indices, id: \.self) { index in
                    Button(action: {
                        selectedSlideIndex = index
                    }) {
                        VStack {
                            if let nsImage = slides[index].image {
                                Image(nsImage: nsImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } else {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.gray.opacity(0.2))
                            }
                        }
                        .frame(width: 120, height: 90)
                        .padding(8)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .background(selectedSlideIndex == index ? Color.blue.opacity(0.2) : Color.clear)
                    .cornerRadius(8)
                }
            }
        }
        .padding()
    }
}

struct NewPresentationView_Previews: PreviewProvider {
    static var previews: some View {
        NewPresentationView()
    }
}

struct SlideInspectorView: View {
    @Binding var slide: Slide
    @State private var isImagePickerPresented = false

    var body: some View {
        VStack {
            Text("Slide Inspector")
                .font(.title)
                .padding()

            Button(action: {
                isImagePickerPresented = true
            }) {
                if let nsImage = slide.image {
                    Image(nsImage: nsImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.2))
                    Text("Add Image")
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }
            .frame(width: 300, height: 225)
            .padding()
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker { image in
                    slide.image = image
                    isImagePickerPresented = false
                }
            }
        }
    }
}

struct ImagePicker: NSViewRepresentable {
    var completionHandler: (NSImage) -> Void

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeNSView(context: Context) -> NSView {
        let view = NSView()
        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {
        if context.coordinator.isFirstAppearance {
            context.coordinator.isFirstAppearance = false
            let panel = NSOpenPanel()
            panel.allowsMultipleSelection = false
            panel.canChooseDirectories = false
            panel.canChooseFiles = true
            panel.allowedFileTypes = ["png", "jpg", "jpeg", "bmp", "gif"]

            panel.begin { response in
                if response == .OK, let url = panel.url, let image = NSImage(contentsOf: url) {
                    completionHandler(image)
                }
            }
        }
    }

    class Coordinator {
        var isFirstAppearance = true
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }
    }
}
