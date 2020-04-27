//
//  NSManagedObjectContext+Extensions.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 18.04.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation
import CoreData

public extension NSManagedObjectContext {
    func insertObject<A: NSManagedObject>() -> A where A: Managed {
        guard let obj = NSEntityDescription.insertNewObject(forEntityName: A.entityName, into: self) as? A else { fatalError("Wrong object type") }
        return obj
    }

    func saveOrRollback() -> Bool {
        do {
            try save()
            return true
        } catch {
            rollback()
            return false
        }
    }

    func performChanges(block: @escaping () -> ()) {
        perform {
            block()
            _ = self.saveOrRollback()
        }
    }
    
    func performChangesSync(block: @escaping () -> ()) -> Bool {
        var result = false
        performAndWait {
            block()
            result = self.saveOrRollback()
        }
        return result
    }
    
}

