//
//  Injection+Key.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 11/2/24.
//

import Foundation

protocol InjectionKey {
    associatedtype Value
    static var currentValue: Self.Value { get }
    static var type: InstanceType { get }
}

extension InjectionKey {
    static var currentValue: Value {
        return Container.resolve(type, Self.self)!
    }
}

struct NetworkKey: InjectionKey {
    typealias Value = NetworkType
    static var type: InstanceType = .singleton
}

struct SearchRepoKey: InjectionKey {
    typealias Value = SearchRepositoryInterface
    static var type: InstanceType = .singleton
}

struct LoginRepoKey: InjectionKey {
    typealias Value = LoginRepositoryInterface
    static var type: InstanceType = .automatic
}
