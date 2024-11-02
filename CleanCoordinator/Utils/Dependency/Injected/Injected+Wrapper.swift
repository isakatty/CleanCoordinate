//
//  Injected+Wrapper.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 11/2/24.
//

import Foundation

@propertyWrapper
struct Injected<Dependency> {
    
    var service: Dependency
    
    init<T>(
        _ key: T.Type,
        _ type: InstanceType = .automatic
    ) where T: InjectionKey, Dependency == T.Value {
        let service: Dependency = key.currentValue
        self.service = service
    }
    
    var wrappedValue: Dependency {
        get { self.service }
        mutating set { service = newValue }
    }
}
