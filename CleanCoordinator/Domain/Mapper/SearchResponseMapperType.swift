//
//  SearchResponseMapperType.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/27/24.
//

import Foundation

protocol MapperServiceProtocol {
    func mapSearchResponse(from dto: SearchResponseDTO) -> SearchResponse
}
