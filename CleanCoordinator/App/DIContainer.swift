//
//  DIContainer.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/27/24.
//

import Foundation

// DIContainer의 목적
final class DIContainer {
    static let shared = DIContainer()
    
    private init() { }
    
    let networkService: NetworkType = NetworkManager()
    lazy var searchRepository: SearchRepositoryProtocol = SearchRepository(network: networkService)
    lazy var searchUseCase: SearchUseCaseProtocl = SearchUseCase(repository: searchRepository)
    
}
