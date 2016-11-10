//
//  CitiesImageComponent.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 11/2/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit
import HubFramework

class CitiesImageComponent: NSObject, HUBComponentWithImageHandling {
   var view: UIView?
    
    var imageView:UIImageView!
    
    
    var layoutTraits: Set<HUBComponentLayoutTrait>
    {
            return [.compactWidth]
    }
    
    func loadView() {
        imageView = UIImageView()
        self.view = imageView
        self.view?.backgroundColor = UIColor.gray
    }
    
    func preferredViewSize(forDisplaying model: HUBComponentModel, containerViewSize: CGSize) -> CGSize {
        let margin:CGFloat = 15
        let width:CGFloat = floor((containerViewSize.width - margin*3)/2)
        return CGSize(width: width, height: floor(width*0.7))
    }
    
    func prepareViewForReuse() {
        imageView = self.view as! UIImageView
        imageView.image = nil
    }
    
    func configureView(with model: HUBComponentModel, containerViewSize: CGSize) {
        
    }
    
    //When Image gets downloaded what size do we wish it to have.
    func preferredSizeForImage(from imageData: HUBComponentImageData, model: HUBComponentModel, containerViewSize: CGSize) -> CGSize {
        return preferredViewSize(forDisplaying: model, containerViewSize: containerViewSize)
        
    }
    
    func updateView(forLoadedImage image: UIImage, from imageData: HUBComponentImageData, model: HUBComponentModel, animated: Bool) {
        imageView = self.view as! UIImageView
        imageView.image = image
    }
    
    
    
}
