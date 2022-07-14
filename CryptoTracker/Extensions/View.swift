import SwiftUI

public extension View {
    func withoutAnimation() -> some View {
        self.animation(nil, value: UUID())
    }
}
