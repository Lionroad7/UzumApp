//
//  DiscountViewcontroller.swift
//  Korzinka-APP task
//
//  Created by islombek on 16/01/24.

import UIKit

class SavatViewController: UIViewController {

    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let basketView = BasketView()
        navigationController?.pushViewController(basketView, animated: true)
        
       
              
    }
}



