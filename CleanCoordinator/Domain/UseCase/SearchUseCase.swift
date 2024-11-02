//
//  SearchUseCase.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/27/24.
//

import Foundation

import RxSwift

final class SearchUseCase: SearchUseCaseProtocol {
    @Injected(SearchRepoKey.self)
    private var repository: SearchRepositoryProtocol
    
    func searchMovie(txt: String, page: Int) -> Single<Result<SearchResponse, NetworkError>> {
        return repository.searchMovie(txt: txt, page: page)
    }
}
