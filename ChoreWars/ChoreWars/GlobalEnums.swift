//
//  GlobalEnums.swift
//  ChoreWars
//
//  Created by Douglas Hewitt on 4/15/17.
//  Copyright © 2017 madebydouglas. All rights reserved.
//

import UIKit

enum StoryboardID: String {
    case Main = "Main"
}

enum ViewControllerID: String {
    case Home = "HomeVC"
    case Roommates = "Roommates"
    case Profile = "Profile"
    case Chores = "Chores"
}

enum CellID: String {
    case Header = "Header"
    case Footer = "Footer"
    
}

enum PageID: String {
    case Days = "ItineraryDays"
}

enum Notify: String {
    case Login = "Login"
    case NewUser = "NewUser"
    case Logout = "Logout"
    case Timer = "Timer"
}

enum App: String {
    case Name = "Chore Wars"
}

enum UserDefaultsKeys: String {
    case firstLoad = "firstLoad"
    case firstView = "firstView"
    case currentUser = "currentUser"
}

enum PhotoSize: Int {
    //        case Chat
    //        case Profile
    case general
    var value: CGFloat {
        switch self {
            //            case .Chat: return 400
        //            case .Profile: return 200
        case .general: return 800
        }
    }
}

enum HeaderHeight: Int {
    case pager
    case section
    var value: CGFloat {
        switch self {
        case .pager: return 54
        case .section: return 50
        }
    }
}

enum CellHeight: Int {
    case wideScreen
    case superWide
    case plans
    case reviews
    var value: CGFloat {
        switch self {
        case .wideScreen: return UIScreen.main.bounds.size.width * (9/16)
        case .superWide: return UIScreen.main.bounds.size.width * (9/21)
        case .plans: return 114
        case .reviews: return 80
        }
    }
}
