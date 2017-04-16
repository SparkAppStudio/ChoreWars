//
//  RoommatesCollectionViewController.swift
//  ChoreWars
//
//  Created by Douglas Hewitt on 3/1/17.
//  Copyright © 2017 madebydouglas. All rights reserved.
//

import UIKit

private let reuseIdentifier = "RoommateCell"

class RoommatesCollectionViewController: UICollectionViewController {

    func wageWar() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView?.backgroundColor = UIColor.white
        
        let left = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(Network.logout))
        
        navigationItem.leftBarButtonItem = left
        navigationItem.title = "Home Name"
        
        let war = UIBarButtonItem(title: "War", style: .plain, target: self, action: #selector(wageWar))
        
        navigationController?.setToolbarItems([war], animated: false)
        navigationController?.setToolbarHidden(false, animated: false)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        let nib = UINib(nibName: "RoommateCell", bundle: nil)
        self.collectionView?.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
//        self.collectionView!.register(RoommateCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Footer
//        let footerNib = UINib(nibName: "FooterButton", bundle: nil)
//        collectionView?.register(footerNib, forSupplementaryViewOfKind: "footer", withReuseIdentifier: "footer")

        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return DataManager.sharedInstance.myRoommates.count
        return 6
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! RoommateCollectionViewCell
    
        // Configure the cell
        cell.configure()
        
        return cell
    }

//    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        <#code#>
//    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let profileVC = ProfileTableViewController()
        
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
