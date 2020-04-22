//
//  CoinDataObject.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 18.04.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation
import CryptoAppNetwork

protocol CoinDataObject {
    var id: String { get set }
    var symbol: String { get set }
    var name: String { get set }
}

struct CoinData: CoinDataObject, Identifiable {
    var id: String
    var symbol: String
    var name: String
    
    static func fromCache(_ item: Coin) -> CoinData {
        let object = CoinData(id: item.id, symbol: item.symbol, name: item.name)
        return object
    }

}
