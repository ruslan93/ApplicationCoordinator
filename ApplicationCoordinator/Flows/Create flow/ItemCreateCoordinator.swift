//
//  CreateCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

final class ItemCreateCoordinator: BaseCoordinator, ItemCreateCoordinatorOutput {

    let factory: ItemCreateModuleFactory
    let router: Router
    var finishFlow: ((ItemList?)->())?
    
    init(router: Router,
        factory: ItemCreateModuleFactory) {
        
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showCreate()
    }
    
//MARK: - Run current flow's controllers
    
    private func showCreate() {
        
        let createItemOutput = factory.makeItemAddOutput()
        createItemOutput.onCompleteCreateItem = { [weak self] item in
            self?.finishFlow?(item)
        }
        createItemOutput.onHideButtonTap = { [weak self] in
            self?.finishFlow?(nil)
        }
        router.setRootModule(createItemOutput)
    }
}
