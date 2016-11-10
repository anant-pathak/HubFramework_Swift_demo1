//
//  ComponentBanner.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 11/9/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit
import HubFramework
class ComponentBanner: NSObject , HUBComponent{
    var view: UIView? //The view that out component is about to create & its
    var banner: Banner!
    
    var layoutTraits: Set<HUBComponentLayoutTrait>{
        return [.fullWidth,.stackable]
    }
    
    func loadView()
    {
       
        self.view = Banner.instanceFromNib()
    }
    
    func preferredViewSize(forDisplaying model: HUBComponentModel, containerViewSize: CGSize) -> CGSize {
        return CGSize(width: containerViewSize.width, height: 50)
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
        print("Anant  \(bannerTemp.label.text)")
        
    }
    

}
