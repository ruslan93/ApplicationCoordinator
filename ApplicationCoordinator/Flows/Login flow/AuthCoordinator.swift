//
//  LoginCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

final class AuthCoordinator: BaseCoordinator, AuthCoordinatorOutput {

    fileprivate let factory: AuthControllersFactory
    fileprivate let router: Router
    var finishFlow: (()->())?
    
    fileprivate weak var signUpView: SignUpView?
    
    init(router: Router,
         factory: AuthControllersFactory) {
        
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showLogin()
    }
    
    //MARK: - Run current flow's controllers
    
    fileprivate func showLogin() {
        
        let loginOutput = factory.makeLoginOutput()
        loginOutput.onCompleteAuth = { [weak self] in
            self?.finishFlow?()
        }
        loginOutput.onSignUpButtonTap = { [weak self] in
            self?.showSignUp()
        }
        router.setRootModule(loginOutput)
    }
    
    fileprivate func showSignUp() {
        
        signUpView = factory.makeSignUpHandler()
        signUpView?.onSignUpComplete = { [weak self] in
            self?.finishFlow?()
        }
        signUpView?.onTermsButtonTap = { [weak self] in
            self?.showTerms()
        }
        router.push(signUpView)
    }
    
    fileprivate func showTerms() {
        
        let termsOutput = factory.makeTermsOutput()
        termsOutput.onPopController = { [weak self] agree in
            self?.signUpView?.conformTermsAgreement(agree)
        }
        router.push(termsOutput)
    }
}
