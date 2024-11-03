//
//  DmViewController.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 11/3/24.
//

import UIKit

final class DmViewController: BaseNavigationViewController {
    private let viewModel: DmViewModel
    
    init(viewModel: DmViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "DM"
    }
    
}
