//
//  ExchangesFRC.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 22.04.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation
import CoreData
import PersistenceService

final class ExchangesFRC: NSObject, NSFetchedResultsControllerDelegate {
    
    var didChangeContent : (([ExchangeData]?)->Void)?
    
    init(context: NSManagedObjectContext) {
        
        let request = Exchange.sortedFetchRequest
        request.fetchBatchSize = 20
        self.frc = NSFetchedResultsController(fetchRequest: Exchange.sortedFetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        
        super.init()
        frc.delegate = self
        try? self.frc.performFetch()
    }
    
    func performFetch() {
        try? frc.performFetch()
        retreiveData()
    }
    
    private func retreiveData() {
        let objects = frc.fetchedObjects?.map { ExchangeData.fromCache($0) }
        didChangeContent?(objects)
    }
    
    private var frc: NSFetchedResultsController<Exchange>
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        retreiveData()
//        let objects = frc.fetchedObjects?.map { ExchangeData.fromCache($0) }
//        didChangeContent?(objects)
    }
    
}
