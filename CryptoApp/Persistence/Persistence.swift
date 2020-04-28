//
//  Persistence.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 21.04.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation
import CoreData
import PersistenceService

protocol Persistence {
    
    init(modelName: String)
    func configure(completion: @escaping ()->Void)
    
    func store<T: Insertable>(_ item: [Any], of type: T.Type)
    func fetch<T1:Managed, T2: Cachable>(type: T1.Type, offset: Int, limit: Int, completion: @escaping ([T2])->Void)
    func fetchAll<T1:Managed, T2: Cachable>(type: T1.Type, completion: @escaping ([T2])->Void)
    
    var viewContext: NSManagedObjectContext { get } 
}
