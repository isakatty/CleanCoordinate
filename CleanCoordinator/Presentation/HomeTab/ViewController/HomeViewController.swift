//
//  HomeViewController.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 11/3/24.
//

import UIKit

final class HomeViewController: BaseViewController {
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        title = "home"
        
        navigationController?.navigationBar.backgroundColor = .white
    }
    
}
