//
//  SearchResponse.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/27/24.
//

import Foundation

struct SearchResponse: Decodable {
    let page: Int
    let results: [SearchResult]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct SearchResult: Decodable {
    let id: Int
    let posterPath: String

    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
    }
}
