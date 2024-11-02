//
//  DefaultSearchRepository.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/27/24.
//

import Foundation

import RxSwift

final class DefaultSearchRepository: SearchRepositoryInterface {
    @Injected(NetworkKey.self)
    private var network: NetworkType
    
    func searchMovie(txt: String, page: Int) -> Single<Result<SearchResponse, NetworkError>> {
        return network.callRequest(router: .searchMovie(target: txt, page: page), type: SearchResponseDTO.self)
            .flatMap { result in
                switch result {
                case .success(let responseDTO):
                    return .just(Result.success(responseDTO.toDomain()))
                case .failure(let error):
                    return .just(Result.failure(error))
                }
            }
    }
}
