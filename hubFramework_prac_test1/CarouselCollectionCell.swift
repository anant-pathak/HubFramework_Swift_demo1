//
//  CarouselCollectionCell.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 12/8/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit
import HubFramework

class CarouselCollectionCell:UICollectionViewCell, HUBComponent

{
    
    //MARK: XIB outlets
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    
    var nameLabel: String{
        get{
            return name.text!
        }
        set{
            name.text = newValue
        }
    }
    var addLabel: String{
        get
        {
            return address.text!
        }
        set
        {
            address.text = newValue
        }
    
    }
    //instantiating the nib file:
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "carouselCell", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

    
    //MARK: HUBComponent Methods
    var view: UIView?
    
    var layoutTraits: Set<HUBComponentLayoutTrait>{
        return [.compactWidth]
    }
    
    func loadView()
    {
            view = CarouselCollectionCell.instanceFromNib()
    }
    
    func preferredViewSize(forDisplaying model: HUBComponentModel, containerViewSize: CGSize) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
    func prepareViewForReuse()
    {
        
        let carouselView = (view! as? CarouselCollectionCell)
        carouselView?.addLabel = ""
        carouselView?.nameLabel = ""
        
    }
    
    func configureView(with model: HUBComponentModel, containerViewSize: CGSize)
    {
            let carouselView = (view! as? CarouselCollectionCell)
            carouselView?.nameLabel = model.title!
            carouselView?.addLabel = model.subtitle!
        
    }
    

    
}
