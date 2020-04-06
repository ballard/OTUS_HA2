//
//  CoinsListViewModel.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 13.03.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation
import CryptoAppNetwork

extension CoinItem: Identifiable {}

final class CoinsListViewModel: ObservableObject {
    
    @Published private(set) var items = [CoinItem]()
    @Published private(set) var isLoading = false
    
    let coinsService: CoinsFetchable
    
    init(service: CoinsFetchable) {
        self.coinsService = service
    }
    
    func fetch() {
        guard  isLoading == false else {
            return
        }
        isLoading = true
        coinsService.fetchCoins { items in
            if let items = items {
                self.items = items
            }
            self.isLoading = false
        }
    }
}
