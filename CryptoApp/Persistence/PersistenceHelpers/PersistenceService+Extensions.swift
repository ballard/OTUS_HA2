//
//  PersistenceManager+Coins.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 19.04.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation
import PersistenceService
import CoreData


extension PersistenceService: Persistence {
    
    var viewContext: NSManagedObjectContext {
        return self.coreDataStack.managedContext
    }
    
    func store<T: Insertable>(_ item: [Any], of type: T.Type) {
        let batchSize = 256
        let count = item.count

        // Determine the total number of batches.
        var numBatches = count / batchSize
        numBatches += count % batchSize > 0 ? 1 : 0

        for batchNumber in 0 ..< numBatches {
            
            // Determine the range for this batch.
            let batchStart = batchNumber * batchSize
            let batchEnd = batchStart + min(batchSize, count - batchNumber * batchSize)
            let range = batchStart..<batchEnd
            
            // Create a batch for this range from the decoded JSON.
            let batch = Array(item[range])
            
            // Stop the entire import if any batch is unsuccessful.
            let moc = self.coreDataStack.backgroundContext
            let result = moc.performChangesSync {
                for item in batch {
                    _ = type.insert(into: moc, data: item)
                }
            }
            moc.reset()
            if !result {
                return
            }
        }
    }
    
    func fetchCoins(offset: Int, limit: Int, completion: @escaping ([CoinData])->Void) {
        let moc = self.coreDataStack.managedContext
        moc.perform {
            let request = Coin.sortedFetchRequest
            request.fetchBatchSize = 20
            request.fetchOffset = offset
            request.fetchLimit = limit
            if let coins = try? moc.fetch(request) {
                let items = coins.map { CoinData.fromCache($0) }
                completion(items)
            }
        }
    }
    
    func fetchExchanges(completion: @escaping ([ExchangeData])->Void) {
        let moc = self.coreDataStack.managedContext
        moc.perform {
            let request = Exchange.sortedFetchRequest
            request.fetchBatchSize = 20
            if let coins = try? moc.fetch(request) {
                let items = coins.map { ExchangeData.fromCache($0) }
                completion(items)
            }
        }
    }
}
