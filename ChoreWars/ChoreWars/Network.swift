//
//  Network.swift
//  ChoreWars
//
//  Created by Douglas Hewitt on 9/24/16.
//  Copyright © 2016 madebydouglas. All rights reserved.
//

import UIKit
import Firebase

class Network: NSObject {

    class func start() {
        FIRApp.configure()
    }
}
