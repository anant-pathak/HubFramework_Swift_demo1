//
//  ComponentBanner.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 11/9/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit
import HubFramework
class ComponentBanner: NSObject , HUBComponent, HUBComponentWithImageHandling, HUBComponentWithChildren {    var view: UIView? //The view that out component is about to create & its
    var bannerObj: Banner!
    var height_xib: Double!
    var childDelegate: HUBComponentChildDelegate? // came from "HUBComponentWithChildren"
    
    var layoutTraits: Set<HUBComponentLayoutTrait>{
        return [.fullWidth]
    }
    
    
    
    func loadView()
    {
        
//        self.view = Banner.instanceFromNib()
//        bannerObj = self.view as! Banner
//        height_xib = bannerObj.giveMeHeight()
//        print("MY height...>>> \(height_xib)")
        self.view = Banner.instanceFromNib()
        bannerObj = self.view as! Banner
        height_xib = bannerObj.giveMeHeight()
        print("MY height...>>> \(height_xib)")
        
    }
    
    func preferredViewSize(forDisplaying model: HUBComponentModel, containerViewSize: CGSize) -> CGSize {
        
        return CGSize(width: containerViewSize.width, height: 300)
    }
    
    func prepareViewForReuse() {
        let bannerTemp: Banner = self.view as! Banner
        bannerTemp.label = nil
        bannerTemp.imageView.image = nil
    }
    
    /**
     
     */
    
    func configureView(with model: HUBComponentModel, containerViewSize: CGSize) {
//        var cell: UITableViewCell = self.view as! UITableViewCell
//        cell.textLabel?.text = model.title
//        cell.detailTextLabel?.text = model.subtitle
//        print(model.customData?["mapiURL"])
        
        let bannerTemp: Banner = self.view as! Banner
        print(model.title)
        bannerTemp.label.text = model.title
        bannerTemp.imageView.image = model.mainImageData?.localImage
        print("Anant  \(bannerTemp.label.text)")
        
//        if  model.children != nil {
//        let hubComponentModel: HUBComponentModel = (model.children?[0])!
//        let child1 = self.childDelegate?.component(self, childComponentFor: hubComponentModel)
//        self.view?.addSubview((child1?.view)!)
//        
//        
//        debugPrint(child1)
//         }
    
        
        
//        childDelegate?.component(<#T##component: HUBComponentWithChildren##HUBComponentWithChildren#>, willDisplayChildAt: <#T##UInt#>, view: <#T##UIView#>)
    }
    
    //MARK: Image Rendering from Network
    
    func preferredSizeForImage(from imageData: HUBComponentImageData, model: HUBComponentModel, containerViewSize: CGSize) -> CGSize {
        return CGSize(width: containerViewSize.width, height: 220)
    }
    
    func updateView(forLoadedImage image: UIImage, from imageData: HUBComponentImageData, model: HUBComponentModel, animated: Bool) {
//        (self.view as! Banner).label.text = 
       print("URL \(model.mainImageData?.url) ")
        (self.view as! Banner).imageView.image = image
    }
    
    //MARK: Handling Child components
    
    
    
    
    

}
