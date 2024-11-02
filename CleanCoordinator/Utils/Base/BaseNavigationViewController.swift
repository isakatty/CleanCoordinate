//
//  BaseNavigationViewController.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/27/24.
//

import UIKit

class BaseNavigationViewController: BaseViewController {
    override var title: String? {
        didSet {
            navigationItem.title = title
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigation()
    }
    
    func setNavigation() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(
            UIImage(),
            for: .default
        )
        
        navigationItem.backBarButtonItem?.tintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: nil,
            style: .plain,
            target: self,
            action: nil
        )
    }
}
