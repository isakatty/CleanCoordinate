//
//  SettingViewController.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 11/3/24.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

final class SettingViewController: BaseNavigationViewController {
    private let viewModel: SettingViewModel
    private let logoutbtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("로그아웃", for: .normal)
        btn.backgroundColor = .blue
        return btn
    }()
    init(viewModel: SettingViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Setting"
    }
    
    override func bind() {
        let input = SettingViewModel.Input(btnTapped: logoutbtn.rx.tap.map { _ in () })
        _ = viewModel.transform(input: input)
    }
    
    override func setHierarchy() {
        view.addSubview(logoutbtn)
    }
    override func setConstraints() {
        logoutbtn.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
    }
}
