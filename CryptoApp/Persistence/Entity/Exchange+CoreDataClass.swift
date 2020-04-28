//
//  Exchange+CoreDataClass.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 21.04.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//
//

import Foundation
import CoreData
import PersistenceService

@objc(Exchange)
public final class Exchange: NSManagedObject, Insertable {
    
    typealias Entity = Exchange
    
    static func insert(into context: NSManagedObjectContext, data: Any) -> Exchange {
        guard let data = data as? ExchangeDataObject else {
            fatalError()
        }
        let exchange: Exchange = context.insertObject()
        exchange.id = data.id
        exchange.name = data.name
        exchange.yearEstablished = Int32(data.yearEstablished ?? 0)
        exchange.country = data.country
        exchange.itemDescription = data.description
        exchange.url = data.url
        exchange.image = data.image
        exchange.hasTradingIncentive = data.hasTradingIncentive ?? false
        exchange.trustScore = Int32(data.trustScore ?? 0)
        exchange.trustScoreRank = Int32(data.trustScoreRank ?? 0)
        exchange.tradeVolume24hBtc = data.tradeVolume24hBtc ?? 0
        exchange.tradeVolume24hBtcNormalized = data.tradeVolume24hBtcNormalized ?? 0
        return exchange
    }
}

extension Exchange: Managed {
    public static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(name), ascending: true)]
    }
}
