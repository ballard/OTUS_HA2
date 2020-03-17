//
//  RandomAccessCollection+Extensions.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 16.03.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation

extension RandomAccessCollection where Self.Element: Identifiable {
    
    public func isLast(_ item: Element) -> Bool {
        guard isEmpty == false else {
            return false
        }
        
        guard let itemIndex = lastIndex(where: { AnyHashable($0.id) == AnyHashable(item.id) }) else {
            return false
        }
        
        return distance(from: itemIndex, to: endIndex) == 1
    }
    
}
