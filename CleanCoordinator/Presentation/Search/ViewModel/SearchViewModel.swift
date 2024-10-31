//
//  SearchViewModel.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/27/24.
//

import Foundation

import RxSwift
import RxCocoa

final class SearchViewModel: ViewModelProtocol {
    var disposeBag: DisposeBag = DisposeBag()
    
    private let searchUseCase: SearchUseCaseProtocl
    private var coordinator: SearchCoordinator
    
    init(
        searchUseCase: SearchUseCaseProtocl,
        coordinator: SearchCoordinator
    ) {
        self.searchUseCase = searchUseCase
        self.coordinator = coordinator
    }
    
    struct Input {
        let searchEnterTapped: Observable<String>
        let btnTap: Observable<Void>
    }
    
    struct Output {
        let searchedList: Driver<[SearchResult]>
        let searchedError: Driver<String>
    }
    
    func transform(input: Input) -> Output {
        let searchedList = PublishRelay<[SearchResult]>()
        let searchedError = PublishRelay<String>()
        
        input.searchEnterTapped
            .bind(with: self) { owner, text in
                print(text)
                owner.searchUseCase.searchMovie(txt: text, page: 1)
                    .subscribe { result in
                        switch result {
                        case .success(let response):
                            print(response)
                            searchedList.accept(response.results)
                        case .failure(let error):
                            searchedError.accept(error.localizedDescription)
                        }
                    }
                    .disposed(by: owner.disposeBag)
            }
            .disposed(by: disposeBag)
        
        input.btnTap
            .bind(with: self) { owner, _ in
                owner.coordinator.toAfterSearch()
            }
            .disposed(by: disposeBag)
        
        return Output(
            searchedList: searchedList.asDriver(onErrorJustReturn: []),
            searchedError: searchedError.asDriver(
                onErrorJustReturn: ""
            )
        )
    }
}
