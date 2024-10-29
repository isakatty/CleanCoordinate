//
//  SearchResponseDTO.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/27/24.
//

import Foundation

struct SearchResponseDTO: Decodable {
    let page: Int
    let results: [SearchResultDTO]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

extension SearchResponseDTO {
    func toDomain() -> SearchResponse {
        return .init(
            page: page,
            results: results.compactMap {
                return .init(id: $0.id, posterPath: $0.posterPath ?? "")
            },
            totalPages: totalPages,
            totalResults: totalResults
        )
    }
}

struct SearchResultDTO: Decodable {
    let id: Int
    let posterPath: String?

    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
    }
}

extension SearchResultDTO {
    func toDomain() -> SearchResult {
        return .init(id: id, posterPath: posterPath ?? "")
    }
}
