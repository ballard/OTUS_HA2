//
//  Coin+CoreDataClass.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 15.04.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//
//

import Foundation
import CoreData
import PersistenceService

@objc(Coin)
public final class Coin: NSManagedObject {
    
    static func insert(into context: NSManagedObjectContext, data: CoinDataObject) -> Coin {
        let coin: Coin = context.insertObject()
        coin.id = data.id
        coin.name = data.name
        coin.symbol = data.symbol
        return coin
    }
}

extension Coin: Managed {
    public static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(id), ascending: true)]
    }
}