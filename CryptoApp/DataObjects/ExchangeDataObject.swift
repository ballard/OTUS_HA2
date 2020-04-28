//
//  ExchangeDataObject.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 21.04.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation
import CryptoAppNetwork

protocol ExchangeDataObject {
    var id: String { get set }
    var name: String { get set }
    var yearEstablished: Int? { get set }
    var country: String? { get set }
    var description: String? { get set }
    var url: String? { get set }
    var image: String? { get set }
    var hasTradingIncentive: Bool? { get set }
    var trustScore: Int? { get set }
    var trustScoreRank: Int? { get set }
    var tradeVolume24hBtc: Double? { get set }
    var tradeVolume24hBtcNormalized: Double? { get set }
}

extension ExchangeData: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id + name)
    }
    
    public static func ==(lhs: ExchangeData, rhs: ExchangeData) -> Bool {
        return lhs.name == rhs.name && lhs.id == rhs.id
    }
}

struct ExchangeData: ExchangeDataObject, Identifiable, Cachable {
    var id: String
    var name: String
    var yearEstablished: Int?
    var country: String?
    var description: String?
    var url: String?
    var image: String?
    var hasTradingIncentive: Bool?
    var trustScore: Int?
    var trustScoreRank: Int?
    var tradeVolume24hBtc: Double?
    var tradeVolume24hBtcNormalized: Double?
    
    static func fromCache(_ item: Any) -> ExchangeData? {
        guard let item = item as? Exchange else { return nil }
        let object = ExchangeData(id: item.id,
        name: item.name,
        yearEstablished: Int(item.yearEstablished),
        country: item.country,
        description: item.itemDescription,
        url: item.url,
        image: item.image,
        hasTradingIncentive: item.hasTradingIncentive,
        trustScore: Int(item.trustScore),
        trustScoreRank: Int(item.trustScoreRank),
        tradeVolume24hBtc: item.tradeVolume24hBtc,
        tradeVolume24hBtcNormalized: item.tradeVolume24hBtcNormalized)
        return object
        
    }
    
    static func fromCache(_ item: Exchange) -> ExchangeData {

        let object = ExchangeData(id: item.id,
        name: item.name,
        yearEstablished: Int(item.yearEstablished),
        country: item.country,
        description: item.itemDescription,
        url: item.url,
        image: item.image,
        hasTradingIncentive: item.hasTradingIncentive,
        trustScore: Int(item.trustScore),
        trustScoreRank: Int(item.trustScoreRank),
        tradeVolume24hBtc: item.tradeVolume24hBtc,
        tradeVolume24hBtcNormalized: item.tradeVolume24hBtcNormalized)
        
        return object
    }

}
