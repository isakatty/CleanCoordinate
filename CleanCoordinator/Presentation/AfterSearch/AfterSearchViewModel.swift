//
//  AfterSearchViewModel.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/30/24.
//

import Foundation

import RxSwift
import RxCocoa

final class AfterSearchViewModel: ViewModelProtocol {
    var afterCoordinator: Coordinator
    var disposeBag: DisposeBag = DisposeBag()
    
    init(afterCoordinator: Coordinator) {
        self.afterCoordinator = afterCoordinator
    }
    
    struct Input {
        let viewWillAppear: Observable<Void>
    }
    struct Output {
        let newText: Driver<String>
    }
    
    func transform(input: Input) -> Output {
        let testText = PublishRelay<String>()
        
        input.viewWillAppear
            .bind { _ in
                testText.accept("test")
            }
            .disposed(by: disposeBag)
        
        return Output(newText: testText.asDriver(onErrorJustReturn: ""))
    }
}
