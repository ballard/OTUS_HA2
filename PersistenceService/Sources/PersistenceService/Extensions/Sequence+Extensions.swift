//
//  Sequence+Extensions.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 18.04.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation

extension Sequence where Iterator.Element: AnyObject {
    func containsObjectIdentical(to object: AnyObject) -> Bool {
        return contains { $0 === object }
    }
}
