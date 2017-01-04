//
//  ViewController.swift
//  ChoreWars
//
//  Created by Douglas Hewitt on 9/24/16.
//  Copyright © 2016 madebydouglas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var squareView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        squareView = UIView(frame: CGRect(x: self.view.frame.width/2 - 50, y: self.view.frame.height/2 - 50, width: 50, height: 50))
        view.backgroundColor = UIColor.blue
        self.view.addSubview(squareView)
        
        let button = UIButton(frame: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 - 100, width: 100, height: 30))
        button.setTitle("Rotate", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(ViewController.didTapButton(sender:)), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        let nav = UINavigationController()
//        nav.viewControllers.append(RoommatesTableViewController())
//        self.present(nav, animated: true, completion: nil)
    }
    
    func didTapButton(sender: UIButton) {
        willRotate(degrees: 45)
    }

    func willRotate(degrees: CGFloat) {
//        let context = UIGraphicsGetCurrentContext()
//        context?.rotate(by: (-degrees * CGFloat.pi) / 180.0)
        self.squareView.transform = CGAffineTransform(rotationAngle: (-degrees * CGFloat.pi) / 180.0)
    }
    
    func didRotate(degrees: CGFloat) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5, animations: {
                //                self.cardinalRingImageView.transform = CGAffineTransform(rotationAngle: (-degrees * CGFloat.pi) / 180.0)
                
                let context = UIGraphicsGetCurrentContext()
                context?.rotate(by: (-degrees * CGFloat.pi) / 180.0)
                
            })
        }
    }


}

