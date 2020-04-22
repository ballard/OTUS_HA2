//
//  ServiceLocator.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 25.03.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation

final class ServiceLocator {
    private var registry : [String: Any] = [:]
    
    func registerService<T>(service: T) {
        let key = "\(T.self)"
        registry[key] = service
    }
    
    func tryGetService<T>() -> T? {
        let key = "\(T.self)"
        return registry[key] as? T
    }
    
    func getService<T>() -> T {
        let key = "\(T.self)"
        return registry[key] as! T
    }
    
    public static let shared = ServiceLocator()
}
