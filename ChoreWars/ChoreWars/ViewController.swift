//
//  ViewController.swift
//  ChoreWars
//
//  Created by Douglas Hewitt on 9/24/16.
//  Copyright © 2016 madebydouglas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let nav = UINavigationController()
        nav.viewControllers.append(RoommatesTableViewController())
        self.present(nav, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

