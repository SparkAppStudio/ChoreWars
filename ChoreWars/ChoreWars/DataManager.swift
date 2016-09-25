//
//  DataManager.swift
//  ChoreWars
//
//  Created by Douglas Hewitt on 9/24/16.
//  Copyright © 2016 madebydouglas. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    static let sharedInstance = DataManager()
    
    func createNewChore() {
        let newChore = Chore(ref: "uniqueID")
        Network.sharedInstance.saveChore(chore: newChore)
    }

}

struct Chore {
    let ref: String

    func toDictionary() -> NSDictionary {
        return ["ref":self.ref]
    }
}

struct Competition {
    
}

struct Household {
    
}

struct Roommate {
    
}

struct Team {
    
}

protocol Firebase {
    var ref: String { get }
    
}
