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
    
    
    var view: UIView? {
        didSet {
            view?.backgroundColor = UIColor.green
        }
    }
    
    var childView: UIView?
    
    var imageView:UIImageView! {
        didSet {
            imageView.backgroundColor = UIColor.red
        }
    }
    
    
    var layoutTraits: Set<HUBComponentLayoutTrait>
    {
            return [.compactWidth]
    }
    
    func loadView() {
        imageView = UIImageView()
        self.view = imageView
        self.view?.backgroundColor = UIColor.green
    }
    
    func preferredViewSize(forDisplaying model: HUBComponentModel, containerViewSize: CGSize) -> CGSize {
        let margin:CGFloat = 15
        let width:CGFloat = floor((containerViewSize.width - margin*3)/2)
      //  return CGSize(width: containerViewSize.width, height: 200)
        return CGSize(width: width, height: floor(width*0.7))
    }
    
    func prepareViewForReuse() {
        imageView = self.view as! UIImageView
        imageView.image = nil
    }
    
    func configureView(with model: HUBComponentModel, containerViewSize: CGSize) {
        self.view?.backgroundColor = UIColor.red
    }
    
    //When Image gets downloaded what size do we wish it to have.
    func preferredSizeForImage(from imageData: HUBComponentImageData, model: HUBComponentModel, containerViewSize: CGSize) -> CGSize {
        return preferredViewSize(forDisplaying: model, containerViewSize: containerViewSize)
        
    }
    
    func updateView(forLoadedImage image: UIImage, from imageData: HUBComponentImageData, model: HUBComponentModel, animated: Bool) {
        imageView = self.view as! UIImageView
        imageView.image = image
      
        let appDelegate_temp = UIApplication.shared.delegate as! AppDelegate
        if let plainView = appDelegate_temp.component_plainview {
            debugPrint(image.size)
            print(model.mainImageData?.url?.absoluteString)
            plainView.componentPlainView_imageView?.image = image
        }
        else
        {
                print("no object has been assigned to component_plainview of AppDelegate yet: Recruit")
        }
      
        
    }
    
    
    
}
