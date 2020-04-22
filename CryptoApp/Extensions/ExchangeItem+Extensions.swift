//
//  ExchangeItem+Extensions.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 21.04.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation
import CryptoAppNetwork

extension ExchangeItem: ExchangeDataObject {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id + name)
    }
    
    public static func ==(lhs: ExchangeItem, rhs: ExchangeItem) -> Bool {
        return lhs.name == rhs.name && lhs.id == rhs.id
    }
}

