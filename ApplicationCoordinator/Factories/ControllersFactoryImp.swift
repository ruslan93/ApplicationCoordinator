//
//  AuthControllersFactory.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 08.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

final class ControllersFactoryImp:
            AuthControllersFactory,
            ItemControllersFactory,
            ItemCreateControllersFactory,
            SettingsControllersFactory {
    
    func makeLoginOutput() -> LoginView {
        return LoginController.controllerFromStoryboard(.auth)
    }
    
    func makeSignUpHandler() -> SignUpView {
        return SignUpController.controllerFromStoryboard(.auth)
    }
    
    func makeTermsOutput() -> TermsView {
        return TermsController.controllerFromStoryboard(.auth)
    }
    
    func makeItemsOutput() -> ItemsListView {
        return ItemsListController.controllerFromStoryboard(.items)
    }
    
    func makeItemDetailOutput(item: ItemList) -> ItemDetailView {
        
        let controller = ItemDetailController.controllerFromStoryboard(.items)
        controller.itemList = item
        return controller
    }
    
    func makeItemAddOutput() -> ItemCreateView {
        return ItemCreateController.controllerFromStoryboard(.create)
    }
    
    func makeSettingsOutput() -> SettingsView {
        return SettingsController.controllerFromStoryboard(.settings)
    }
}
