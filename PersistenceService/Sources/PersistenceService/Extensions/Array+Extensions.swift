//
//  Array+Extensions.swift
//  Moody
//
//  Created by Иван Лазарев on 18.04.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation

extension Array {
    var decomposed: (Iterator.Element, [Iterator.Element])? {
        guard let x = first else { return nil }
        return (x, Array(self[1..<count]))
    }
}

