//
//  MainCoordinator.swift
//  Coordinator_DesignPattern
//
//  Created by Jean Paul Borges Manzini on 23/01/22.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
    var parentCorodinator: MainCoordinator? = nil
    
    var childCoordinators =  [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        
        let vc = HomeViewController()
        
        vc.buyAction = { [weak self] in
            self?.buySubscription()
        }
        
        vc.accountAction = { [weak self] in
            self?.accountSubscription()
        }
        
        navigationController.pushViewController(vc, animated: false)
    }
    
    private func buySubscription() {
        let child = BuyCoordinator(navigationController: navigationController)
        child.parentCorodinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    private func accountSubscription() {
        let child = AccountCoordinator(navigationController: navigationController)
        child.parentCorodinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    private func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated(){
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {return}
        
        if navigationController.viewControllers.contains(fromViewController){
            return
        }
        
        if let accountViewController = fromViewController as? AccountViewController {
            childDidFinish(accountViewController.coordinator)
        }
        
        if let buyViewController = fromViewController as? BuyViewController {
            childDidFinish(buyViewController.coordinator)
        }
        
        print(childCoordinators.count)
        
    }
    
    
}
