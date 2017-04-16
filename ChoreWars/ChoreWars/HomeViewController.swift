//
//  HomeViewController.swift
//  ChoreWars
//
//  Created by Douglas Hewitt on 3/1/17.
//  Copyright © 2017 madebydouglas. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var joinHomeButton: UIButton!
    @IBOutlet weak var createHomeButton: UIButton!
    
    @IBAction func didTapCreateHome(_ sender: UIButton) {
        displayCreateMenu()
    }
    
    @IBAction func didTapJoinHome(_ sender: UIButton) {
        displayJoinMenu()
    }
    
    @IBAction func didTapLogout(_ sender: UIBarButtonItem) {
        Network.logout()
    }
    
    
    func displayJoinMenu() {
        //alert controller
        let alert = UIAlertController(title: "Join Your Friends", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Join", style: .default, handler: { [weak self] (action) in
            let textField = alert.textFields![0] as UITextField
            self?.parseJoinText(text: textField.text)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addTextField { (textField) in
            textField.placeholder = "Enter friend's cell number"
            textField.keyboardType = .phonePad
        }
        present(alert, animated: true, completion: nil)
    }
    
    func displayCreateMenu() {
        //alert controller
        let alert = UIAlertController(title: "Create a new Home", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Create", style: .default, handler: { [weak self] (action) in
            let textField = alert.textFields![0] as UITextField
            self?.parseCreateText(text: textField.text)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addTextField { (textField) in
            textField.placeholder = "Enter the name of your home"
            textField.keyboardType = .namePhonePad
        }
        present(alert, animated: true, completion: nil)
    }
    
    func parseJoinText(text: String?) {
        guard text != nil && text != "" else { print("no chore name given"); return }
        joinHome(cellNumber: text!)
    }
    
    func parseCreateText(text: String?) {
        guard text != nil && text != "" else { print("no chore name given"); return }
        createHome(name: text!)
    }
    
    func joinHome(cellNumber: String) {
        //do stuff
        loadHome()
    }
    
    func createHome(name: String) {
        //do stuff
        loadHome()
    }
    
    func loadHome() {
//        let roommatesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RoommatesCollectionViewController")
        
        let layout = UICollectionViewFlowLayout()
//        layout.indexPathsToInsertForSupplementaryView(ofKind: "footer")
        let cardSize = CGSize(width: 160, height: 320)
        layout.itemSize = cardSize
        let roommatesVC = RoommatesCollectionViewController(collectionViewLayout: layout)
        
        navigationController?.setViewControllers([roommatesVC], animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
