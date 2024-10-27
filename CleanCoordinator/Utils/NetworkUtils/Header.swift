//
//  Header.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/27/24.
//

import Foundation

struct Header {
    static let hasAPIKeyHeader = {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "Key") as? String
        else { fatalError("Key not found in Info.plist") }
        return ["Authorization": key]
    }()
    
    static let hasJsonHeader = {
        return ["accept": "application/json"]
    }()
    
    static func merging(_ headers: [String: String]...) -> [String: String] {
        headers.reduce(into: [String: String]()) { result, header in
            result.merge(header) { current, _ in current }
        }
    }
}
