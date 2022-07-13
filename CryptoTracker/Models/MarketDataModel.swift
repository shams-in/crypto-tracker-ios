import Foundation

// https://api.coingecko.com/api/v3/global

/*
 
 {
    "data":{
       "active_cryptocurrencies":13421,
       "upcoming_icos":0,
       "ongoing_icos":49,
       "ended_icos":3376,
       "markets":525,
       "total_market_cap":{
          "btc":46568727.87281284,
          "eth":867535020.8142244,
          "ltc":19020395244.105328,
          "bch":9219535414.636414,
          "bnb":4080666048.938693,
          "eos":977027765956.7999,
          "xrp":2911401684302.3584,
          "xlm":8962636198360.998,
          "link":149030653971.40414,
          "dot":141740148102.89215,
          "yfi":163990575.3151305,
          "usd":906349075269.1003,
          "aed":3329065470917.1685,
          "ars":115637678798203.23,
          "aud":1341397537747.341,
          "bdt":84646763416750.61,
          "bhd":341665504555.1173,
          "bmd":906349075269.1003,
          "brl":4931626588354.23,
          "cad":1180459851499.0369,
          "chf":889816361787.1166,
          "clp":924158834598137.9,
          "cny":6095016261369.625,
          "czk":22058361254269.266,
          "dkk":6719885036077.783,
          "eur":903147850335.2499,
          "gbp":762589423044.3678,
          "hkd":7114767732936.407,
          "huf":368167245776289.6,
          "idr":1.3580643908924666e+16,
          "ils":3147800187608.725,
          "inr":72038158045023.36,
          "jpy":124018463016296.64,
          "krw":1.183644942512997e+15,
          "kwd":279096602492.9901,
          "lkr":326087273628742.94,
          "mmk":1677080375259763.5,
          "mxn":18907416035369.324,
          "myr":4021470846968.998,
          "ngn":376424897940762.3,
          "nok":9295298592181.834,
          "nzd":1479458066986.7844,
          "php":51072770391413.93,
          "pkr":187885115563753.53,
          "pln":4353875276673.0156,
          "rub":52953447441644.51,
          "sar":3401755573102.826,
          "sek":9586977132537.684,
          "sgd":1276107775761.2598,
          "thb":32814021138421.93,
          "try":15691621540133.922,
          "twd":27093946987905.926,
          "uah":26759656445776.266,
          "vef":90752732906.69513,
          "vnd":2.1203130266845324e+16,
          "zar":15433998159932.19,
          "xdr":669155709573.0282,
          "xag":47866333950.38064,
          "xau":525066146.2848929,
          "bits":46568727872812.836,
          "sats":4.656872787281284e+15
       },
       "total_volume":{
          "btc":3956660.121397275,
          "eth":73709147.26608066,
          "ltc":1616046707.5911186,
          "bch":783327562.9201424,
          "bnb":346709248.07464087,
          "eos":83012076465.07353,
          "xrp":247364003008.833,
          "xlm":761500407000.5887,
          "link":12662223607.32901,
          "dot":12042793892.316444,
          "yfi":13933276.670269094,
          "usd":77006940193.35982,
          "aed":282850341677.2202,
          "ars":9825026646238.12,
          "aud":113970348493.1125,
          "bdt":7191918021276.564,
          "bhd":29029229237.75064,
          "bmd":77006940193.35982,
          "brl":419010162980.10956,
          "cad":100296457143.79852,
          "chf":75602256597.29272,
          "clp":78520126568159.31,
          "cny":517856271412.3043,
          "czk":1874164107649.9146,
          "dkk":570947551224.5139,
          "eur":76734951680.59688,
          "gbp":64792561381.53029,
          "hkd":604498319962.6583,
          "huf":31280920177726.26,
          "idr":1153864291163283.5,
          "ils":267449338673.24927,
          "inr":6120641902311.037,
          "jpy":10537090647477.99,
          "krw":100567074856018.95,
          "kwd":23713132128.44223,
          "lkr":27705642189449.766,
          "mmk":142491267085743.53,
          "mxn":1606447554894.1914,
          "myr":341679793637.9375,
          "ngn":31982522401106.164,
          "nok":789764696957.4524,
          "nzd":125700507665.00642,
          "php":4339341079895.8364,
          "pkr":15963449682060.63,
          "pln":369922165960.79236,
          "rub":4499130711817.876,
          "sar":289026375287.6679,
          "sek":814546839429.6565,
          "sgd":108423076549.34393,
          "thb":2788006776042.4966,
          "try":1333221155567.6375,
          "twd":2302007043677.142,
          "uah":2273604419911.7437,
          "vef":7710704921.561128,
          "vnd":1801500358883458.8,
          "zar":1311332471866.255,
          "xdr":56854069930.877335,
          "xag":4066909777.2267747,
          "xau":44611660.592817016,
          "bits":3956660121397.275,
          "sats":395666012139727.5
       },
       "market_cap_percentage":{
          "btc":40.997883927909825,
          "eth":13.799197719273096,
          "usdt":7.26584627813741,
          "usdc":6.092657937858151,
          "bnb":4.001481667988091,
          "busd":1.9726599262119646,
          "xrp":1.66001734726711,
          "ada":1.599958191157966,
          "sol":1.2631724420894037,
          "doge":0.8874148316699155
       },
       "market_cap_change_percentage_24h_usd":-4.898481707975424,
       "updated_at":1657658917
    }
 }
 
 */

struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
//        if let item = totalMarketCap.first(where: { (key, value) -> Bool in
//            return key == "usd"
//        }) {
//            return "\(item.value)"
//        }
        
        // or, the sort way
        
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$\(item.value.formattedWithAbbreviations())"
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$\(item.value.formattedWithAbbreviations())"
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: {$0.key == "btc" }) {
            return item.value.asPercentString()
        }
        return ""
    }
}

