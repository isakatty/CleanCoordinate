//
//  SearchResponseMapper.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/27/24.
//

import Foundation

struct MapperService: MapperServiceProtocol {
    func mapSearchResponse(from dto: SearchResponseProtocol) -> SearchResponse {
        return SearchResponse(
            page: dto.page,
            results: dto.results.compactMap({ dto in
                SearchResult(id: dto.id, posterPath: dto.posterPath ?? "")
            }),
            totalPages: dto.totalPages,
            totalResults: dto.totalResults
        )
    }
}
