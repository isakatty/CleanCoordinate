//
//  DefaultLoginRepository.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 11/3/24.
//

import Foundation

import RxSwift

final class DefaultLoginRepository: LoginRepositoryInterface {
    @Injected(NetworkKey.self)
    private var network: NetworkType
}
