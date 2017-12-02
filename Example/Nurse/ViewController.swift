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
        do {
            let renault = try InjectorProvider.injector.getInstance(of: Car.self)
            let ford = try InjectorProvider.injector.getInstance(of: Car.self, name: "Ford")
            
            assert(renault is Renault)
            assert(ford is Ford)
            assert(!renault.wheels.isEmpty)
        } catch {
            print(error)
            assertionFailure(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

