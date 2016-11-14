//
//  ComponentBanner.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 11/9/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit
import HubFramework
class ComponentBanner: NSObject , HUBComponent, HUBComponentWithImageHandling {
    var view: UIView? //The view that out component is about to create & its
    var bannerObj: Banner!
    var height_xib: Double!
    var layoutTraits: Set<HUBComponentLayoutTrait>{
        return [.fullWidth,.stackable]
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
    }
    
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
        
    }
    
    //MARK: Image Rendering from Network
    
    func preferredSizeForImage(from imageData: HUBComponentImageData, model: HUBComponentModel, containerViewSize: CGSize) -> CGSize {
        return CGSize(width: containerViewSize.width, height: 220)
    }
    
    func updateView(forLoadedImage image: UIImage, from imageData: HUBComponentImageData, model: HUBComponentModel, animated: Bool) {
//        (self.view as! Banner).label.text = 
        (self.view as! Banner).imageView.image = image
    }
    
    
    

}
