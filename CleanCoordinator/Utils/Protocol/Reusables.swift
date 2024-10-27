//
//  Reusables.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/27/24.
//

import Foundation

protocol Reusables {
    static var identifier: String { get }
}

extension Reusables {
    static var identifier: String {
        return String(describing: self)
    }
}
