//
//  AfterSearchViewController.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/30/24.
//

import UIKit

final class AfterSearchViewController: BaseNavigationViewController {
    let afterVM: AfterSearchViewModel
    
    init(afterVM: AfterSearchViewModel) {
        self.afterVM = afterVM
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "AfterSearch"
    }
}

