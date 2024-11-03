//
//  TabKind.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 11/3/24.
//

import UIKit

enum TabKind: CaseIterable {
    case workspace, dm, search, setting
    
    var tabItem: UITabBarItem {
        switch self {
        case .workspace:
            return .init(title: "홈", image: UIImage(named: "HomeTab"), selectedImage: UIImage(named: "unSelectedHomeTab"))
        case .dm:
            return .init(title: "DM", image: UIImage(named: "DMTab"), selectedImage: UIImage(named: "unSelectedDMTab"))
        case .search:
            return .init(title: "검색", image: UIImage(named: "SearchTab"), selectedImage: UIImage(named: "unSelectedSearchTab"))
        case .setting:
            return .init(title: "설정", image: UIImage(named: "SettingTab"), selectedImage: UIImage(named: "unSelectedSettingTab"))
        }
    }
}
