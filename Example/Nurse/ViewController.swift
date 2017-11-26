//
//  ViewController.swift
//  Nurse
//
//  Created by Gunmer on 11/26/2017.
//  Copyright (c) 2017 Gunmer. All rights reserved.
//

import UIKit
import Nurse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let renault = try? InjectorProvider.injector.getInstance(of: Car.self)
        assert(renault == nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

