//
//  Container.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 11/2/24.
//

import Foundation

struct Container {
    private static var factories: [String: () -> Any] = [:]
    private static var cache: [String: Any] = [:]
    
    static func removeCache() {
        factories = [:]
        cache = [:]
    }
    
    // MARK: Old version
    static func register<Dependency>(type: Dependency.Type,
                                     _ factory: @autoclosure @escaping () -> Dependency) {
        factories[String(describing: type.self)] = factory
    }
    
    // MARK: New One using injectionKey
    static func register<T: InjectionKey>(_ name: T.Type,
                                          _ factory: @autoclosure @escaping () -> Dependency) {
        factories[String(describing: name.self)] = factory
    }
    
    static func resolve<Dependency>(_ resolveType: InstanceType = .automatic,
                                    _ type: Any.Type?) -> Dependency? {
        let serviceName = type.map { String(describing: $0) } ?? String(describing: Dependency.self)
        
        switch resolveType {
        case .singleton:
            if let service = cache[serviceName] as? Dependency {
                return service
            } else {
                let service = factories[serviceName]?() as? Dependency
                if let service = service {
                    cache[serviceName] = service
                    return service
                }
            }
            Log.error("fattalError singleton Occur")
            assert(false, "fattalError singleton Occur")
        case .newSingleton:
            let service = factories[serviceName]?() as? Dependency
            if let service = service {
                cache[serviceName] = service
                return service
            }
            Log.error("fattalError singleton Occur")
            assert(false, "fattalError singleton Occur")
        case .new, .automatic:
            if let dependency = factories[serviceName]?() as? Dependency {
                return dependency
            }
            Log.error("fattalError singleton Occur")
            assert(false, "fattalError singleton Occur")
        }
        return nil
    }
}
