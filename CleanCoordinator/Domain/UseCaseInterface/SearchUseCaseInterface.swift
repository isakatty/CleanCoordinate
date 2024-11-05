//
//  SearchUseCaseInterface.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/27/24.
//

import Foundation

import RxSwift

protocol SearchUseCaseInterface: Dependency, AnyObject {
    func searchMovie(txt: String, page: Int) -> Single<Result<SearchResponse, NetworkError>>
}
