//
//  HomeViewModel.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 11/3/24.
//

import Foundation

import RxSwift

final class HomeViewModel: ViewModelProtocol {
    var disposeBag: DisposeBag = DisposeBag()
    
    private let coordinator: HomeCoordinator
    
    init(coordinator: HomeCoordinator) {
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
