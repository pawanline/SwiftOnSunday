//
//  ViewController.swift
//  DeclarativUI
//
//  Created by Pawan Kumar on 04/03/19.
//  Copyright © 2019 PawanShivHari inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let navigationManager  = NavigationManager()
        
        navigationManager.fetch { (initialScreen) in
            let vc = TableScreen(screen: initialScreen)
            navigationController?.viewControllers = [vc]
        }
    }

}
