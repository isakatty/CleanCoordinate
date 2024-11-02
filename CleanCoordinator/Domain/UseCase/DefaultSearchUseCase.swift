//
//  DefaultSearchUseCase.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/27/24.
//

import Foundation

import RxSwift

final class DefaultSearchUseCase: SearchUseCaseInterface {
    @Injected(SearchRepoKey.self)
    private var repository: SearchRepositoryInterface
    
    func searchMovie(txt: String, page: Int) -> Single<Result<SearchResponse, NetworkError>> {
        return repository.searchMovie(txt: txt, page: page)
    }
}
