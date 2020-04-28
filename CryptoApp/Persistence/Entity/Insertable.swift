//
//  Insertable.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 27.04.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation
import CoreData

protocol Insertable {
    
    static func insert(into context: NSManagedObjectContext, data: Any) -> Self?
}
