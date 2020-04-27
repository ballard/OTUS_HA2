//
//  PersistenceManager.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 16.04.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation
import CoreData

public final class PersistenceService {
    
    public lazy var coreDataStack: CoreDataStack = { [weak self] in
        guard let self = self else { fatalError() }
        return CoreDataStack(modelName: self.modelName)
    }()
    
    private let modelName: String
    
    public init(modelName: String) {
        self.modelName = modelName
    }
    
    public func configure(completion: @escaping ()->Void) {
        coreDataStack.configure(completion: completion)
    }
}
