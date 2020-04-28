//
//  Exchange+CoreDataProperties.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 21.04.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//
//

import Foundation
import CoreData


extension Exchange {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exchange> {
        return NSFetchRequest<Exchange>(entityName: Exchange.entityName)
    }

    @NSManaged public var id: String
    @NSManaged public var name: String
    @NSManaged public var yearEstablished: Int32
    @NSManaged public var country: String?
    @NSManaged public var itemDescription: String?
    @NSManaged public var url: String?
    @NSManaged public var image: String?
    @NSManaged public var hasTradingIncentive: Bool
    @NSManaged public var trustScore: Int32
    @NSManaged public var trustScoreRank: Int32
    @NSManaged public var tradeVolume24hBtc: Double
    @NSManaged public var tradeVolume24hBtcNormalized: Double

}
