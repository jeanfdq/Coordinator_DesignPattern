//
//  HomeViewController.swift
//  Coordinator_DesignPattern
//
//  Created by Jean Paul Borges Manzini on 23/01/22.
//

import UIKit

class HomeViewController: UIViewController {

    var buyAction: (() -> Void)?
    var accountAction: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        
        let buttonBuy = UIButton(frame: .init(x: 0, y: 0, width: 220, height: 55))
        view.addSubview(buttonBuy)
        buttonBuy.center.x = view.center.x
        buttonBuy.center.y = view.center.y
        buttonBuy.setTitleColor(.white, for: .normal)
        buttonBuy.setTitle("Buy Controller", for: .normal)
        buttonBuy.addTarget(self, action: #selector(didTapBuyButton), for: .touchUpInside)
        
        let buttonAccount = UIButton(frame: .init(x: 0, y: 0, width: 220, height: 55))
        view.addSubview(buttonAccount)
        buttonAccount.center.x = view.center.x
        buttonAccount.center.y = view.center.y + 70
        buttonAccount.setTitleColor(.white, for: .normal)
        buttonAccount.setTitle("Account Controller", for: .normal)
        buttonAccount.addTarget(self, action: #selector(didTapAccountButton), for: .touchUpInside)

    }
    
    @objc
    fileprivate func didTapBuyButton(){
        buyAction?()
    }
    
    @objc
    fileprivate func didTapAccountButton(){
        accountAction?()
    }

}
