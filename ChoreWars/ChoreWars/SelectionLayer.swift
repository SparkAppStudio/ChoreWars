//
//  SelectionLayer.swift
//  ChoreWars
//
//  Created by Douglas Hewitt on 4/15/17.
//  Copyright © 2017 madebydouglas. All rights reserved.
//

import UIKit

class SelectionLayer: CALayer {
    override init() {
        super.init()
        self.backgroundColor = UIColor.white.withAlphaComponent(0.4).cgColor
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addBadge() {
        let badgeLayer = CALayer()
        badgeLayer.frame = CGRect(x: self.bounds.width - 30, y: self.bounds.height - 30, width: 25, height: 25)
        badgeLayer.contents = UIImage(named: "check_icon")?.cgImage
        
        self.addSublayer(badgeLayer)
    }
}
