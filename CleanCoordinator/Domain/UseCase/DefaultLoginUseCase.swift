//
//  DefaultLoginUseCase.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 11/3/24.
//

import Foundation

final class DefaultLoginUseCase: LoginUseCaseInterface {
    @Injected(LoginRepoKey.self)
    private var repository: LoginRepositoryInterface
    
}
