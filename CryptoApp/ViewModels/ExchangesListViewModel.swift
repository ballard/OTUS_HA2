//
//  ExchangesListViewModel.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 16.03.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation
import CryptoAppNetwork

extension ExchangeItem: Identifiable {}

final class ExchangesListViewModel: ObservableObject {
    
    @Published private(set) var items: [ExchangeItem] = [ExchangeItem]()
    @Published private(set) var page: Int = 0
    @Published private(set) var isPageLoading = false
    
    let exchangesService: ExchangesFetchable
    
    init(service: ExchangesFetchable) {
        self.exchangesService = service
    }
    
    func loadPage() {
        guard  isPageLoading == false else {
            return
        }
        
        isPageLoading = true
        print("sending request")
        exchangesService.fetchExchangesFromPage(page, withLimit: 20) { items in
            if let items = items {
                self.items.append(contentsOf: items)
            }
            self.isPageLoading = false
            self.page += 1
            print("model items count: \(self.items.count)")
        }
    }
}
