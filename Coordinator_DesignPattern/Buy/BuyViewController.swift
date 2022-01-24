//
//  BuyViewController.swift
//  Coordinator_DesignPattern
//
//  Created by Jean Paul Borges Manzini on 23/01/22.
//

import UIKit

class BuyViewController: UIViewController {

    weak var coordinator: BuyCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemMint
    }
}
