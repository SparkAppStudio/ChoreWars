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
        let newChore = Chore(ref: Date().description, name: "blah")
        Network.sharedInstance.saveChore(chore: newChore)
    }
    
    var myChores = [Chore]()

}

struct Chore {
    let ref: String
    let name: String

    func toDictionary() -> NSDictionary {
        return ["ref":self.ref, "name":self.name]
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
