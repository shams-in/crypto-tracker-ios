  import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Path { path in
                path.move(to: .zero)
                path.addLine(to: CGPoint(x: 300, y: 0))
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.addLine(to: CGPoint(x: 0, y: 300))
//                path.addArc(
//                    center: .zero,
//                    radius: 300,
//                    startAngle: .zero,
//                    endAngle: .degrees(90),
//                    clockwise: false)
            }
            .fill(.radialGradient(
                Gradient(colors: [.red, .yellow]),
                center: .topLeading,
                startRadius: 0,
                endRadius: 300))
            
            VStack(alignment: .leading) {
                Text("Primary")
                    .font(.title)
                Text("Secondary")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            RoundedRectangle(cornerRadius: 10)
                .stroke(.mint, lineWidth: 10)
                .frame(width: 200, height: 50)
            
            Text("Hello, world!")
                .foregroundColor(.customRed)
                .padding()
        }
        
    }
}

struct AnimationTest: View {
    // Think of animationAmount as a light switch
    // The view has one look when value is 1.0 and a different look when value is 1.5
    @State private var animationAmount = 1.0
    var body: some View {
        Button("Tap Me") {
            // important button function here
        }
        .padding(50)
        .background(.yellow)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.indigo)
                .scaleEffect(animationAmount)
                .opacity(1.5 - animationAmount)
            // value tells SwiftUI to render scale and opacity between 1.0 and 1.5
            // SwiftUI determines how many frames to render based on duration
                .animation(
                    .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        )
        .onAppear {
            // Switch the value to 1.5
            // The view has a different look when the value is 1.5
            animationAmount = 1.5
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
//            .preferredColorScheme(.light)
        AnimationTest().frame(width: 300, height: 300)
    }
}
