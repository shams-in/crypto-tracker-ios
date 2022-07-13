import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistics: [StastisticModel] = []
    
//    @Published var statistics: [StastisticModel] = [
//        StastisticModel(title: "Title", value: "value", percentageChange: 1),
//        StastisticModel(title: "Title", value: "value"),
//        StastisticModel(title: "Title", value: "value"),
//        StastisticModel(title: "Title", value: "value", percentageChange: -1)
//    ]
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    @Published var sortOption: SortOption = .holdings
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private let portfolioDataService = PortfolioDataService()
    private var cancellables = Set<AnyCancellable>()
    
    
    enum SortOption {
        case rank, rankReversed, holdings, holdingsReversed, price, priceReversed
    }
    
    init() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            self.allCoins.append(DeveloperPreview.instance.coin)
//            self.portfolioCoins.append(DeveloperPreview.instance.coin)
//        }
        addSubscribers()
    }
    
    func addSubscribers() {
//        dataService.$allCoins
//            .sink { [weak self] (returnedCoins) in
//                self?.allCoins = returnedCoins
//            }
//            .store(in: &cancellables)
        
        // updates allCoins
        $searchText
            .combineLatest(coinDataService.$allCoins, $sortOption)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
//            .map { (text, startingCoins) -> [CoinModel] in
//                guard !text.isEmpty else {
//                    return startingCoins
//                }
//                let lowercasedText = text.lowercased()
//                return startingCoins.filter { coin -> Bool in
//                    return coin.name.lowercased().contains(lowercasedText) ||
//                        coin.symbol.lowercased().contains(lowercasedText) ||
//                        coin.id.lowercased().contains(lowercasedText)
//                }
//            }
            .map(filterAndSortCoins)
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        // updates market data
        marketDataService.$marketData
            .combineLatest($portfolioCoins)
            .map(mapGlobalMarketData)
//            .map { marketDataModel -> [StastisticModel] in
//                var stats: [StastisticModel] = []
//                guard let data = marketDataModel else {
//                    return stats
//                }
//                let marketCap = StastisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
//                let volume = StastisticModel(title: "24h Volume", value: data.volume)
//                let btcDominance = StastisticModel(title: "BTC Dominance", value: data.btcDominance)
//                let portfolio = StastisticModel(title: "Portfolio Value", value: "$0.00", percentageChange: 0)
//
//                stats.append(contentsOf: [
//                    marketCap,
//                    volume,
//                    btcDominance,
//                    portfolio
//                ])
//                return stats
//            }
            .sink { [weak self] returnedStats in
                self?.statistics = returnedStats
                self?.isLoading = false
            }
            .store(in: &cancellables)
        
        // updates portfolio coins
        $allCoins
            .combineLatest(portfolioDataService.$savedEntities)
            .map { coinModels, portfolioEntities -> [CoinModel] in
                coinModels.compactMap { coin -> CoinModel? in
                    guard let entity = portfolioEntities.first(where: { $0.coinID == coin.id }) else {
                        return nil
                    }
                    return coin.updateHoldings(amount: entity.amount)
                }
            }
            .sink { [weak self] returnedCoins in
                guard let self = self else { return }
                self.portfolioCoins = self.sortPortfolioCoinsIfNeeded(coins: returnedCoins)
            }
            .store(in: &cancellables)
    }
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        portfolioDataService.updatePortfolio(coin, amount)
    }
    
    func reloadData() {
        isLoading = true
        coinDataService.getCoins()
        marketDataService.getData()
        HapticManager.notification(type: .success)
    }
    
    private func filterAndSortCoins(text: String, coins: [CoinModel], sortOption: SortOption) -> [CoinModel] {
        // filtered
        var updatedCoins = filterCoins(text: text, coins: coins)
        sortCoins(sort: sortOption, coins: &updatedCoins)
        return updatedCoins
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        let lowercasedText = text.lowercased()
        return coins.filter { coin -> Bool in
            return coin.name.lowercased().contains(lowercasedText) ||
                coin.symbol.lowercased().contains(lowercasedText) ||
                coin.id.lowercased().contains(lowercasedText)
        }
    }
    
    private func sortCoins(sort: SortOption, coins: inout [CoinModel]) {
        switch sort {
        case .rank, .holdings:
            coins.sort(by: { $0.rank < $1.rank })
//            return coins.sorted { coin1, coin2 -> Bool in
//                return coin1.rank < coin2.rank
//            }
        case .rankReversed, .holdingsReversed:
            coins.sort(by: { $0.rank > $1.rank })
        case .price:
            coins.sort(by: { $0.currentPrice > $1.currentPrice })
        case .priceReversed:
            coins.sort(by: { $0.currentPrice < $1.currentPrice })
        }
    }
    
//    -- replace with the more efficient way above --
//    private func sortCoins(sort: SortOption, coins: [CoinModel]) -> [CoinModel] {
//        switch sort {
//        case .rank, .holdings:
//            return coins.sorted(by: { $0.rank < $1.rank })
////            return coins.sorted { coin1, coin2 -> Bool in
////                return coin1.rank < coin2.rank
////            }
//        case .rankReversed, .holdingsReversed:
//            return coins.sorted(by: { $0.rank > $1.rank })
//        case .price:
//            return coins.sorted(by: { $0.currentPrice > $1.currentPrice })
//        case .priceReversed:
//            return coins.sorted(by: { $0.currentPrice < $1.currentPrice })
//        }
//    }
    
    private func sortPortfolioCoinsIfNeeded(coins: [CoinModel]) -> [CoinModel] {
        // will only sort by hondings or reverseHoldings if needed
        switch sortOption {
        case .holdings:
            return coins.sorted(by: { $0.currentHoldingsValue > $1.currentHoldingsValue })
        case .holdingsReversed:
            return coins.sorted(by: { $0.currentHoldingsValue < $1.currentHoldingsValue })
        default:
            return coins
        }
    }
    
    private func mapGlobalMarketData(marketDataModel: MarketDataModel?, portfolioCoins: [CoinModel]) -> [StastisticModel] {
        var stats: [StastisticModel] = []
        guard let data = marketDataModel else {
            return stats
        }
        let marketCap = StastisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = StastisticModel(title: "24h Volume", value: data.volume)
        let btcDominance = StastisticModel(title: "BTC Dominance", value: data.btcDominance)
        
//        let portfolioValue = portfolioCoins.map { portfolioCoin -> Double in
//            portfolioCoin.currentHoldingsValue
//        }
//        or
        let portfolioValue = portfolioCoins.map({ $0.currentHoldingsValue }).reduce(0, +)
        
        let previousValue = portfolioCoins
            .map { coin -> Double in
                let currentValue = coin.currentHoldingsValue
                let percentChange = Double(coin.priceChangePercentage24H ?? 0) / 100 // how much the coin has changes in 24h
                // 25% -> 25 -> .25
                let previousValue = currentValue / (1 + percentChange)
                return previousValue
            }
            .reduce(0, +)
        
        let percentageChange = ((portfolioValue - previousValue) / previousValue) * 100
        
        
        let portfolio = StastisticModel(title: "Portfolio Value", value: portfolioValue.asCurrencyWith2Decimals(), percentageChange: percentageChange)
        
        stats.append(contentsOf: [
            marketCap,
            volume,
            btcDominance,
            portfolio
        ])
        return stats
    }
}
