//
//  AppDelegate+Register.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 11/2/24.
//

import Foundation

extension AppDelegate {
    func registerDependencies() {
        Container.register(NetworkKey.self, NetworkManager())
        Container.register(SearchRepoKey.self, DefaultSearchRepository())
        Container.register(LoginRepoKey.self, DefaultLoginRepository())
    }
}
