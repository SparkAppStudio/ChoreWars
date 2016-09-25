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
    static let sharedInstance = Network()
    
    enum Reference: String {
        case Households = "Households"
        case Roommates = "Roommates"
        case Competitions = "Competitions"
        case Teams = "Teams"
        case Chores = "Chores"
    }

    class func start() {
        FIRApp.configure()
    }
    
    let rootRef = FIRDatabase.database().reference()
    let householdsRef = FIRDatabase.database().reference().child(Reference.Households.rawValue)
    let myHouseholdRef = "currentUserHouseholdID"
    
    func saveChore(chore: Chore) {
        let choreRef = householdsRef.child(myHouseholdRef).child(Reference.Chores.rawValue).child(chore.ref)
        choreRef.setValue(chore.toDictionary())
    }
}
