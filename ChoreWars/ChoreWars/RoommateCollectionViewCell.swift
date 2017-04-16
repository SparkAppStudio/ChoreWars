//
//  RoommateCollectionViewCell.swift
//  ChoreWars
//
//  Created by Douglas Hewitt on 4/3/17.
//  Copyright © 2017 madebydouglas. All rights reserved.
//

import UIKit

class RoommateCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var profileNameLabel: UILabel!
    
    func configure() {
        profileNameLabel.text = "name"
        profileImageView.makeProfile()
    }
}
