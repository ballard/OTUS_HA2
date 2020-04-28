//
//  CoinsListViewModel.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 13.03.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation
import CryptoAppNetwork
import CoreData
import PersistenceService

extension CoinItem: Identifiable {}

final class CoinsListViewModel: ObservableObject {
    
    @Published private(set) var items = [CoinData]()
    @Published private(set) var offset: Int = 0
    @Published private(set) var isLoading = false
    @Published private(set) var isFetching = false
    
    private let offsetStep = 100
    
    let coinsService: CoinsFetchable
    let cacheSerice: Persistence
    
    init(service: CoinsFetchable, cache: Persistence) {
        self.coinsService = service
        self.cacheSerice = cache
    }
    
    func fetchCoinsFromCache() {
        guard isFetching == false else {
            return
        }
        isFetching = true
        print("fetching data with ofsset: \(self.offset)")
        cacheSerice.fetchCoins(offset: self.offset, limit: self.offsetStep) { data in
            if data.count > 0 {
                self.items.append(contentsOf: data)
                self.offset += self.offsetStep
            } else {
                self.downloadCoins()
            }
            self.isFetching = false
        }
    }
    
    func downloadCoins() {
        guard  isLoading == false else {
            return
        }
        isLoading = true
        coinsService.fetchCoins { [weak self] items in
            guard let self = self else { return }
            if let items = items {
                DispatchQueue.global(qos: .userInitiated).async {
                    self.cacheSerice.storeCoins(items)
                    DispatchQueue.main.async {
                        self.isLoading = false
                        self.fetchCoinsFromCache()
                    }
                }
            }
        }
    }
    
    
}
