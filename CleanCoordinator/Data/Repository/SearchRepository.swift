//
//  SearchRepository.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/27/24.
//

import Foundation

import RxSwift

final class SearchRepository: SearchRepositoryProtocol {
    private let network: NetworkType
    
    init(network: NetworkType) {
        self.network = network
    }
    
    func searchMovie(txt: String, page: Int) -> Single<Result<SearchResponse, NetworkError>> {
        return network.callRequest(router: .searchMovie(target: txt, page: page), type: SearchResponseDTO.self)
            .flatMap { [weak self] result in
                guard let self else { return .error(NetworkError.invalidResponse)}
                switch result {
                case .success(let responseDTO):
                    return .just(Result.success(responseDTO.toDomain()))
                case .failure(let error):
                    return .just(Result.failure(error))
                }
            }
    }
}
