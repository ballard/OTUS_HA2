//
//  CoinDataObject.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 18.04.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation
import CryptoAppNetwork

protocol Cachable {
    static func fromCache(_ item: Any) -> Self?
}

protocol CoinDataObject {
    var id: String { get set }
    var symbol: String { get set }
    var name: String { get set }
}

struct CoinData: CoinDataObject, Identifiable, Cachable {
    var id: String
    var symbol: String
    var name: String
    
    static func fromCache(_ item: Any) -> CoinData? {
        guard let item = item as? Coin else { return nil }
        let object = CoinData(id: item.id, symbol: item.symbol, name: item.name)
        return object
        
    }
    
    static func fromCache(_ item: Coin) -> CoinData {
        let object = CoinData(id: item.id, symbol: item.symbol, name: item.name)
        return object
    }

    static func fromItem(_ item: CoinItem) -> CoinData {
        let object = CoinData(id: item.id, symbol: item.symbol, name: item.name)
        return object
    }
}
