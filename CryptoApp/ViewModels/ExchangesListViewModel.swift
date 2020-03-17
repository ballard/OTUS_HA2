//
//  ExchangesListViewModel.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 16.03.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation

extension ExchangeItem: Identifiable {}

final class ExchangesListViewModel: ObservableObject {
    
    @Published private(set) var items: [ExchangeItem] = [ExchangeItem]()
    @Published private(set) var page: Int = 0
    @Published private(set) var isPageLoading = false
    
    func loadPage() {
        guard  isPageLoading == false else {
            return
        }
        page += 1
        isPageLoading = true
        print("sending request")
        ListAPI.getExchanges(perPage: 20, page: page) { response, error in
            if let results = response {
                self.items.append(contentsOf: results)
            }
            self.isPageLoading = false
            print("model items count: \(self.items.count)")
        }
    }
}
