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
    private var afterCoordinator: AfterSearchCoordinator
    var disposeBag: DisposeBag = DisposeBag()
    
    init(afterCoordinator: AfterSearchCoordinator) {
        self.afterCoordinator = afterCoordinator
    }
    
    deinit {
        afterCoordinator.finish()
        Log.debug("AfterSearchViewModel deinit")
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
