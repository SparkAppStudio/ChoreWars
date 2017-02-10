//
//  DataManager.swift
//  ChoreWars
//
//  Created by Douglas Hewitt on 9/24/16.
//  Copyright © 2016 madebydouglas. All rights reserved.
//

import UIKit
import Firebase

class DataManager: NSObject {
    static let sharedInstance = DataManager()
    
    func createNewChore(name: String, key: String) {
        let newChore = Chore(name: name, key: key)
        Network.sharedInstance.saveChore(chore: newChore)
    }
    
    var myChores = [Chore]()

}

struct Chore: Firebase {
    
    
    //MARK: - firebase chore data
    
    internal var ref: FIRDatabaseReference?
    internal var key: String
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        
        ref = snapshot.ref
        
        print("snapshot key: \(snapshot.key)")
        print("reference key: \(snapshot.ref.key)")
    }
    
    
    //MARK: - general chore data
    
    let name: String

    init(name: String, key: String) {
        self.key = key
        self.ref = nil
        
        self.name = name
    }
    
    func toDictionary() -> NSDictionary {
        return ["name":self.name]
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
    var ref: FIRDatabaseReference? { get }
    var key: String { get }

    init(snapshot: FIRDataSnapshot)
}
