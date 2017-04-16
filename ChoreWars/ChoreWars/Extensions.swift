//
//  Extensions.swift
//  ChoreWars
//
//  Created by Douglas Hewitt on 4/3/17.
//  Copyright © 2017 madebydouglas. All rights reserved.
//

import UIKit
import Photos

extension String {
    func trimWhiteSpace() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
}

extension PHAsset {
    
    func getAdjustedSize(_ maxDimension: CGFloat)-> CGSize {
        let width = CGFloat(pixelWidth)
        let height = CGFloat(pixelHeight)
        var newWidth: CGFloat = 0
        var newHeight: CGFloat = 0
        
        if height > width {
            newHeight = maxDimension
            newWidth = maxDimension * (width / height )
        } else {
            newWidth = maxDimension
            newHeight = maxDimension * ( height / width )
        }
        return CGSize(width: newWidth, height: newHeight)
    }
}

extension UIImage {
    func getAdjustedSize(_ maxDimension: CGFloat)-> CGSize {
        let height = size.height
        let width = size.width
        var newHeight: CGFloat = 0
        var newWidth: CGFloat = 0
        if height > width {
            newHeight = maxDimension
            newWidth = maxDimension * (width / height )
        } else {
            newWidth = maxDimension
            newHeight = maxDimension * ( height / width )
        }
        return CGSize(width: newWidth, height: newHeight)
    }
}

//extension UIImageView {
//    fileprivate func setNetworkImage(_ endPoint: String, onCompletion: @escaping (Data?) -> Void) {
//        if let cleanURL = URL(string: Plango.sharedInstance.cleanEndPoint(endPoint)) {
//            self.af_setImage(withURL: cleanURL, placeholderImage: nil, filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: .noTransition, runImageTransitionIfCached: false, completion: { (response) in
//                if response.result.isSuccess {
//                    if let image = response.result.value {
//                        let imageData = UIImageJPEGRepresentation(image, 1.0)
//                        onCompletion(imageData)
//                    }
//                }
//            })
//        }
//        
//    }
//    
//    fileprivate func setLocalImage(_ localAvatar: Data?) {
//        guard let avatar = localAvatar else {return}
//        self.image = UIImage(data: avatar)
//        if let compound = self as? CompoundImageView {
//            compound.gradientDarkToClear() //set gradient after image is present
//        }
//    }
//    
//    func plangoImage(_ object: PlangoObject) {
//        if Helper.isConnectedToNetwork() == false {
//            self.setLocalImage(object.localAvatar as Data?)
//        } else {
//            guard let endPoint = object.avatar else {self.backgroundColor = UIColor.plangoBackgroundGray(); return}
//            
//            self.setNetworkImage(endPoint, onCompletion: { (avatar) in
//                if let compound = self as? CompoundImageView {
//                    compound.gradientDarkToClear() //set gradient after image is present
//                }
//                
//                object.localAvatar = avatar //save image data to RAM as soon as network request finishes so it will be ready to save to Realm when user taps download plan
//            })
//        }
//    }
//}

extension UILabel {
    func dropShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
    }
}

extension UIBarButtonItem {
    func hide(_ sender: Bool) {
        self.isEnabled = !sender
        if sender == true {
            self.tintColor = UIColor.clear
        } else {
            self.tintColor = UIColor.white
        }
    }
}

extension UINavigationController {
    
    override open var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    //New implementation to prevent autorotate yet allow camera to rotate for proper pictures
    //works across the app because everything is embedded in the UINavigationController
    override open var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
}

extension IndexSet {
    
    func aapl_indexPathsFromIndexesWithSection(_ section: Int) -> [IndexPath] {
        var indexPaths: [IndexPath] = []
        indexPaths.reserveCapacity(self.count)
        (self as NSIndexSet).enumerate({idx, stop in
            indexPaths.append(IndexPath(item: idx, section: section))
        })
        return indexPaths
    }
    
}

extension UITableView {
    // breaks tableview ability to recognize select
    //    public override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    //        super.touchesBegan(touches, withEvent: event)
    //        self.endEditing(true)
    //    }
}

extension UICollectionView {
    //    public override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    //        super.touchesBegan(touches, withEvent: event)
    //        self.endEditing(true)
    //    }
    
    
    //### returns empty Array, rather than nil, when no elements in rect.
    func aapl_indexPathsForElementsInRect(_ rect: CGRect) -> [IndexPath] {
        guard let allLayoutAttributes = self.collectionViewLayout.layoutAttributesForElements(in: rect)
            else {return []}
        let indexPaths = allLayoutAttributes.map{$0.indexPath}
        return indexPaths
    }
    
}

extension UICollectionViewFlowLayout {
    func cellsFitAcrossScreen(_ numberOfCells: Int, labelHeight: CGFloat, cellShapeRatio: CGFloat) -> CGSize {
        //using information from flowLayout get proper spacing for cells across entire screen
        let insideMargin = self.minimumInteritemSpacing
        let outsideMargins = self.sectionInset.left + self.sectionInset.right
        let numberOfDivisions: Int = numberOfCells - 1
        let subtractionForMargins: CGFloat = insideMargin * CGFloat(numberOfDivisions) + outsideMargins
        
        let fittedWidth = (UIScreen.main.bounds.width - subtractionForMargins) / CGFloat(numberOfCells)
        let ratioHeight = fittedWidth * cellShapeRatio
        
        return CGSize(width: fittedWidth, height: ratioHeight + labelHeight)
    }
    
    func widescreenCards() -> CGSize {
        let cellWidth = UIScreen.main.bounds.size.width * 0.6
        let cellHeight = cellWidth * (9/16)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

struct SimpleError {
    var statusCode: Int?
    var message: String?
}

extension UIResponder {
    func printSimpleError(_ error: SimpleError) {
        if let status = error.statusCode, let message = error.message {
            print("In \(self) Status Code: \(status) Message: \(message)")
        }
    }
    
    func printError(_ error: NSError) {
        print("In \(self) Code: \(error.code) Failure Reason: \(String(describing: error.localizedFailureReason))")
    }
}

extension UIImageView {
    func makeProfile() {
        self.backgroundColor = UIColor.gray
        self.makeCircle()
    }
}

extension UIView {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.endEditing(true)
    }
    
    func fitViewConstraintsTo(_ view: UIView) {
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
    
    func fitLoginButtons(_ controller: UIViewController) {
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.widthAnchor.constraint(equalToConstant: controller.view.frame.width - 16).isActive = true
    }
    
    func fitLoginLabels() {
        self.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    func makeCircle() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
    func copyView() -> AnyObject {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self))! as AnyObject
    }
    
    func makeRoundCorners(_ divider: Int) {
        self.layer.cornerRadius = self.frame.size.width / CGFloat(divider)
        self.clipsToBounds = true
    }
    
    func addSelectionLayer() {
        let select = SelectionLayer()
        select.frame = self.bounds
        select.addBadge()
        self.layer.addSublayer(select)
    }
}
