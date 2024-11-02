//
//  LoginViewController.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 11/2/24.
//

import UIKit

import SnapKit
import RxSwift

final class LoginViewController: BaseNavigationViewController {
    private let viewModel: LoginViewModel
    
    private let loginBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("로그인", for: .normal)
        btn.backgroundColor = .blue
        return btn
    }()
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func bind() {
        let input = LoginViewModel.Input(btnTapped: loginBtn.rx.tap.map { _ in () })
        let output = viewModel.transform(input: input)
    }
    
    override func setHierarchy() {
        [loginBtn]
            .forEach { view.addSubview($0) }
    }
    
    override func setConstraints() {
        loginBtn.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
    }
    
    
}

