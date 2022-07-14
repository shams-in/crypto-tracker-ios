import SwiftUI

struct DetailView: View {
    
//    @Binding var coin: CoinModel?
//
//    init(coin: Binding<CoinModel?>) {
//        self._coin = coin
//        print("init detail view for \(coin.wrappedValue?.name)")
//    }
//
//    var body: some View {
//        Text(coin?.name ?? "")
//    }
    
    var coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        print("init detail view for \(coin.name)")
    }
    
    var body: some View {
        Text(coin.name)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coin)
//        DetailView(coin: .constant(dev.coin))
    }
}
