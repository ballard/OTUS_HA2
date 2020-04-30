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
    
    @Published private(set) var items = [ExchangeData]()
    @Published private(set) var isPageLoading = false
    @Published private(set) var isPageFetching = false
    
    private var page = 1
    private let limit = 100
    var isInitialLoad = true
    
    let exchangesService: ExchangesFetchable
    let cacheService: Persistence
    let frc: ExchangesFRC
    
    init(service: ExchangesFetchable, cache: Persistence) {
        self.exchangesService = service
        self.cacheService = cache
        self.frc = ExchangesFRC(context: cache.viewContext)
        frc.didChangeContent = { [weak self] items in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if let items = items, items.count > 0 {
                    print("new data arrived: \(items.count)")
                    self.items = items
                    if self.isInitialLoad {
                        let pageNum = Int((Double(items.count)/Double(self.limit)).rounded(.down)) + 1
                        print("new page number: \(pageNum)")
                        self.page = pageNum
                        self.isInitialLoad = false
                    }
                } else {
                    self.isInitialLoad = false
                    self.downloadExchanges()
                }
            }
        }
    }
    
    func loadPage() {
        frc.performFetch()
    }
    
    func downloadExchanges() {
        guard isPageLoading == false else {
            return
        }
        isPageLoading = true
        print("sending request")
        exchangesService.fetchExchangesFromPage(self.page, withLimit: self.limit) { items in
            if let items = items {
                print("downloaded items count: \(items.count) page \(self.page) limit \(self.limit)")
                DispatchQueue.global(qos: .userInitiated).async {
                    self.cacheService.storeExchanges(items)
                    DispatchQueue.main.async {
                        self.isPageLoading = false
                        if items.count > 0 {
                            self.page += 1
                        }
                    }
                }
            }
            
        }
    }
    
}
