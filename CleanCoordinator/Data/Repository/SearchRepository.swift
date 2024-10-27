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
    
    func searchMovie(txt: String, page: Int) -> Single<Result<SearchResponseDTO, NetworkError>> {
        return network.callRequest(router: .searchMovie(target: txt, page: page), type: SearchResponseDTO.self)
    }
}
