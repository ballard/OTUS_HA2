//
//  CoreDataStack.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 14.04.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation
import CoreData

public final class CoreDataStack {
    
    private let modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    // MARK: - Core Data stack
    lazy public var managedContext: NSManagedObjectContext = {
        guard let context = self.storeContainer?.viewContext else { fatalError() }
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        context.automaticallyMergesChangesFromParent = true
        return context
    }()
    
    public var backgroundContext: NSManagedObjectContext {
        guard let moc = storeContainer?.newBackgroundContext() else {
            fatalError()
        }
        moc.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return moc
    }
    
    var storeContainer: NSPersistentContainer?
    
    func configure(completion: @escaping ()->Void = {}) {
        self.createPersistentContainer { [weak self] container in
            self?.storeContainer = container
            completion()
        }
    }
    
    private func createPersistentContainer(completion: @escaping (NSPersistentContainer) -> ()) {
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores { store, error in
            guard error == nil else { fatalError("Failed to load store: \(error!)") }
            print("store loaded with :\(store.url?.absoluteString ?? "")")
            DispatchQueue.main.async { completion(container) }
        }
    }
    // MARK: - Core Data Saving support
    func saveContext () {
      guard managedContext.hasChanges else { return }
      do {
        try managedContext.save()
      } catch let error as NSError {
        print("Unresolved error \(error), \(error.userInfo)")
      }
    }
}
