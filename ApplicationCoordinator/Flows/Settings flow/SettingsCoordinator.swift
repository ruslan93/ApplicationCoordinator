//
//  SettingsCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

final class SettingsCoordinator: BaseCoordinator {

    fileprivate let factory: SettingsControllersFactory
    fileprivate let router: Router
    
    init(router: Router,
        factory: SettingsControllersFactory) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showSettings()
    }
    
    //MARK: - Run current flow's controllers
    
    fileprivate func showSettings() {
        let settingsFlowOutput = factory.makeSettingsOutput()
        router.setRootModule(settingsFlowOutput)
    }
}
