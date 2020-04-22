//
//  Coin+CoreDataProperties.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 15.04.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//
//

import Foundation
import CoreData

extension Coin {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Coin> {
        return NSFetchRequest<Coin>(entityName: "Coin")
    }

    @NSManaged public var id: String
    @NSManaged public var symbol: String
    @NSManaged public var name: String

}
