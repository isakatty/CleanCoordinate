//
//  BaseViewController.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 10/27/24.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        view.backgroundColor = .black
        
        bind()
        setHierarchy()
        setConstraints()
    }
    
    func bind() { }
    
    func setHierarchy() { }
    
    func setConstraints() { }
}
