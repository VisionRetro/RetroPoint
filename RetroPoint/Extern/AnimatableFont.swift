// @copyright André Trettin

import SwiftUI

public extension View {
    @warn_unqualified_access
    func scaledFont(size: Double, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
        modifier(ScalierFontModifier(size: size, weight: weight, design: design))
    }

    @warn_unqualified_access
    func animatableFont(size: Double, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
        modifier(AnimatableFontModifier(size: size, weight: weight, design: design))
    }
}

struct ScalierFontModifier: ViewModifier {
    var size: Double
    var weight: Font.Weight = .regular
    var design: Font.Design = .default

    @Environment(\.fontScaleFactor) var fontScaleFactor

    func body(content: Content) -> some View {
        content
            .animatableFont(size: size * Double(fontScaleFactor), weight: weight, design: design)
    }
}

struct AnimatableFontModifier: AnimatableModifier {
    var size: Double
    var weight: Font.Weight = .regular
    var design: Font.Design = .default

    var animatableData: Double {
        get { size }
        set { size = newValue }
    }

    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight, design: design))
    }
}

extension EnvironmentValues {
    var fontScaleFactor: Int {
        get { self[ScalableFontSizeKey.self] }
        set { self[ScalableFontSizeKey.self] = newValue }
    }
}

struct ScalableFontSizeKey: EnvironmentKey {
    static var defaultValue = 1
}
