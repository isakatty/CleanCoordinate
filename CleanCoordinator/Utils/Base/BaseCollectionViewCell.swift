//
//  BaseCollectionViewCell.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/27/24.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() { }
    
    func setLayout() { }
}

extension UICollectionViewCell: Reusables { }
