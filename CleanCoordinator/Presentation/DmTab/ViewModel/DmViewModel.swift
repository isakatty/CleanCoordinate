//
//  DmViewModel.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 11/3/24.
//

import Foundation

import RxSwift

final class DmViewModel: ViewModelProtocol {
    var disposeBag: DisposeBag = DisposeBag()
    private let coordinator: DmCoordinator
    
    init(coordinator: DmCoordinator) {
        self.coordinator = coordinator
    }
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(input: Input) -> Output {
        
        return Output()
    }
}
