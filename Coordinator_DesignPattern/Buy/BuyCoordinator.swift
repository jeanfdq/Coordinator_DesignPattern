//
//  BuyCoordinator.swift
//  Coordinator_DesignPattern
//
//  Created by Jean Paul Borges Manzini on 23/01/22.
//

import UIKit

class BuyCoordinator: Coordinator {
    
    var parentCorodinator: MainCoordinator?
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = BuyViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
