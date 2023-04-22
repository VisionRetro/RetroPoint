// @copyright André Trettin

import SwiftUI

public extension View {
    @warn_unqualified_access
    @ViewBuilder
    func checkAnimationEnd<Value: VectorArithmetic>(for value: Value, onEnd: @escaping () -> Void) -> some View {
        modifier(AnimationEndCallback(for: value, onEnd: onEnd))
    }
}

private struct AnimationEndCallback<Value: VectorArithmetic>: Animatable, ViewModifier {
    var animatableData: Value {
        didSet {
            checkIfFinished()
        }
    }

    var endValue: Value
    var onEnd: () -> Void

    init(for value: Value, onEnd: @escaping () -> Void) {
        animatableData = value
        endValue = value
        self.onEnd = onEnd
    }

    func body(content: Content) -> some View {
        content
    }

    private func checkIfFinished() {
        if endValue == animatableData {
            Task { @MainActor in
                onEnd()
            }
        }
    }
}
