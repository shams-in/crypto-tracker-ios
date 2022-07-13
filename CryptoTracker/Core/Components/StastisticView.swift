import SwiftUI

struct StastisticView: View {
    
    let stat: StastisticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(.customSecondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(.customAccent)
            HStack {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees: (stat.percentageChange ?? 0) < 0 ? 180 : 0))
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                .fontWeight(.bold)
            }
            .foregroundColor((stat.percentageChange ?? 0) < 0 ? .customRed : .customGreen)
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        }
    } 
}

struct StastisticView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StastisticView(stat: dev.stat1)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            StastisticView(stat: dev.stat2)
                .previewLayout(.sizeThatFits)
            StastisticView(stat: dev.stat3)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
