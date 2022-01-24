//
//  Coordinator.swift
//  Coordinator_DesignPattern
//
//  Created by Jean Paul Borges Manzini on 23/01/22.
//

import UIKit

protocol Coordinator: AnyObject {
    var parentCorodinator: MainCoordinator? {get set}
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    
    func start()
}
