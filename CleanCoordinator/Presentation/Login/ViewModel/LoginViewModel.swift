//
//  LoginViewModel.swift
//  CleanCoordinator
//
//  Created by Jisoo Ham on 11/3/24.
//

import Foundation

import RxSwift
import RxCocoa

final class LoginViewModel: ViewModelProtocol {
    var disposeBag: DisposeBag = DisposeBag()
    
    private let loginUseCase: LoginUseCaseInterface
    private let loginCoordinator: LoginCoordinator
    
    init(loginUseCase: LoginUseCaseInterface, loginCoordinator: LoginCoordinator) {
        self.loginUseCase = loginUseCase
        self.loginCoordinator = loginCoordinator
    }
    
    struct Input {
        let btnTapped: Observable<Void>
    }
    struct Output {
        
    }
    
    func transform(input: Input) -> Output {
        
        input.btnTapped
            .bind(with: self) { owner, _ in
                UserDefaults.standard.setValue(true, forKey: "login")
                
                owner.loginResult()
            }
            .disposed(by: disposeBag)
        
        return Output()
    }
    
    private func loginResult() {
        guard let isLogined = UserDefaults.standard.value(forKey: "login") as? Bool else {
//            Log.error("로그인 에러")
            return
        }
        print(isLogined)
        
        if isLogined {
            loginCoordinator.moveToTab()
        }
    }
}
