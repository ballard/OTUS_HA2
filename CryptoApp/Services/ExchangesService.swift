//
//  ExchangesService.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 26.03.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation

protocol ExchangesFetchable {
    func fetchExchangesFromPage(_ page: Int, withLimit limit: Int, withCompletion completion: @escaping ([ExchangeItem]?)->Void)
}

final class ExchangesService: ExchangesFetchable {
    
    func fetchExchangesFromPage(_ page: Int, withLimit limit: Int, withCompletion completion: @escaping ([ExchangeItem]?)->Void) {
        ListAPI.getExchanges(perPage: limit, page: page) { items, error in
            completion(items)
        }
    }
}
