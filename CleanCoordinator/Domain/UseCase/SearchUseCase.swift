//
//  SearchUseCase.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/27/24.
//

import Foundation

import RxSwift

final class SearchUseCase: SearchUseCaseProtocol {
    private let repository: SearchRepositoryProtocol
    
    init(repository: SearchRepositoryProtocol) {
        self.repository = repository
    }
    
    func searchMovie(txt: String, page: Int) -> Single<Result<SearchResponse, NetworkError>> {
        return repository.searchMovie(txt: txt, page: page)
    }
}
