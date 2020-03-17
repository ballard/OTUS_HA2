//
// ExchangeItem.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct ExchangeItem: Codable {

    public var id: String
    public var name: String
    public var yearEstablished: Int?
    public var country: String?
    public var description: String?
    public var url: String?
    public var image: String?
    public var hasTradingIncentive: Bool?
    public var trustScore: Int?
    public var trustScoreRank: Int?
    public var tradeVolume24hBtc: Double?
    public var tradeVolume24hBtcNormalized: Double?

    public init(id: String, name: String, yearEstablished: Int?, country: String?, description: String?, url: String?, image: String?, hasTradingIncentive: Bool?, trustScore: Int?, trustScoreRank: Int?, tradeVolume24hBtc: Double?, tradeVolume24hBtcNormalized: Double?) {
        self.id = id
        self.name = name
        self.yearEstablished = yearEstablished
        self.country = country
        self.description = description
        self.url = url
        self.image = image
        self.hasTradingIncentive = hasTradingIncentive
        self.trustScore = trustScore
        self.trustScoreRank = trustScoreRank
        self.tradeVolume24hBtc = tradeVolume24hBtc
        self.tradeVolume24hBtcNormalized = tradeVolume24hBtcNormalized
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case yearEstablished = "year_established"
        case country
        case description
        case url
        case image
        case hasTradingIncentive = "has_trading_incentive"
        case trustScore = "trust_score"
        case trustScoreRank = "trust_score_rank"
        case tradeVolume24hBtc = "trade_volume_24h_btc"
        case tradeVolume24hBtcNormalized = "trade_volume_24h_btc_normalized"
    }

}
