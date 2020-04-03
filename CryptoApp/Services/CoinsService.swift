//
//  CoinsService.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 26.03.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation
import CryptoAppUI

final class CoinsService: CoinsFetchable {
    
    func fetchCoins(_ completion: @escaping ([CoinItem]?) -> Void) {
        ListAPI.getCoinsList { items, error in
            completion(items)
        }
    }
}
