//
//  Persistence.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 21.04.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation
import CoreData
import PersistenceService

protocol Persistence {
    
    init(modelName: String)
    func configure(completion: @escaping ()->Void)
    func storeCoins(_ items: [CoinDataObject])
    func storeExchanges(_ items: [ExchangeDataObject])
    func fetchCoins(offset: Int, limit: Int, completion: @escaping ([CoinData])->Void)
    var viewContext: NSManagedObjectContext { get } 
}
