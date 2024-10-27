//
//  SearchUseCase.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/27/24.
//

import Foundation

import RxSwift

final class SearchUseCase: SearchUseCaseProtocl {
    private let repository: SearchRepositoryProtocol
    private let mapper: MapperServiceProtocol
    
    init(repository: SearchRepositoryProtocol, mapper: MapperServiceProtocol) {
        self.repository = repository
        self.mapper = mapper
    }
    
    func searchMovie(txt: String, page: Int) -> Single<Result<SearchResponse, NetworkError>> {
        return repository.searchMovie(txt: txt, page: page)
            .flatMap { [weak self] result in
                guard let self else { return .error(NetworkError.invalidResponse)}
                
                switch result {
                case .success(let responseDTO):
                    let response = self.mapper.mapSearchResponse(from: responseDTO)
                    return .just(Result.success(response))
                case .failure(let error):
                    return .just(Result.failure(error))
                }
            }
    }
}
