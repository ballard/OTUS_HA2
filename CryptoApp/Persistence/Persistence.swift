//
//  Persistence.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 21.04.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation
import CoreData

protocol Persistence {
    
    init(modelName: String)
    func configure(completion: @escaping ()->Void)
    
    func store<T: Insertable>(_ item: [Any], of type: T.Type)
//    func store<T>(_ item: [T], of type: StoreType)
    func fetchCoins(offset: Int, limit: Int, completion: @escaping ([CoinData])->Void)
    func fetchExchanges(completion: @escaping ([ExchangeData])->Void)
    
    var viewContext: NSManagedObjectContext { get } 
}
