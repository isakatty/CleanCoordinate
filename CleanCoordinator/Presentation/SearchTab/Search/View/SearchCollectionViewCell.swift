//
//  SearchCollectionViewCell.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/27/24.
//

import UIKit

import Kingfisher
import SnapKit

final class SearchCollectionViewCell: BaseCollectionViewCell {
    private let posterImg: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    override func setUI() {
        contentView.addSubview(posterImg)
    }
    
    override func setLayout() {
        posterImg.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setImage(posterPath: String) {
        // Kingfisher
        posterImg.kf.setImage(with: URL(string: URLConstant.imageURL + posterPath))
    }
}
