import SwiftUI

struct CoinPortfolioRow: View {
    let coin: CoinModel
    var body: some View {
        VStack {
            CoinImageView(coin: coin)
                .frame(width: 50, height: 50)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundColor(.customAccent)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            Text(coin.name)
                .font(.caption)
                .foregroundColor(.customSecondaryText)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
        }
    }
}

struct CoinPortfolioRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinPortfolioRow(coin: dev.coin)
                .previewLayout(.sizeThatFits)
            CoinPortfolioRow(coin: dev.coin)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
