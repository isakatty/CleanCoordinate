//
//  DIContainer.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/27/24.
//

import Foundation

final class DIContainer {
    static let shared = DIContainer()
    
    private init() { }
    
    func createSearchViewModel() -> SearchViewModel {
        let repository = SearchRepository(network: NetworkManager())
        let useCase = SearchUseCase(repository: repository)
        return SearchViewModel(searchUseCase: useCase)
    }
}
