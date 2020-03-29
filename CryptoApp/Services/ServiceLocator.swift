//
//  ServiceLocator.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 25.03.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation

protocol ServiceLocating {
    func getService<T>() -> T?
}

final class ServiceLocator: ServiceLocating {
    
    private lazy var services: Dictionary<String, Any> = [:]

    private func typeName(some: Any) -> String {
        return (some is Any.Type) ? "\(some)" : "\(type(of: some as AnyObject))"
    }

    func addService<T>(service: T) {
        let key = typeName(some: T.self)
        services[key] = service
    }

    func getService<T>() -> T? {
        let key = typeName(some: T.self)
        return services[key] as? T
    }
    public static let shared = ServiceLocator()
}
