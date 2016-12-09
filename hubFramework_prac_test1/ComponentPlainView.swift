//
//  ComponentPlainView.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 11/15/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit
import HubFramework

class ComponentPlainView: NSObject, HUBComponentWithChildren {
    var view: UIView! //The view that out component is about to create & its
    var stackView: UIStackView!
    var componentPlainView_appDelegate: AppDelegate?
    var componentPlainView_imageView: UIImageView? {
        didSet {
            componentPlainView_imageView?.backgroundColor = UIColor.yellow
        }
    }
    
    var childDelegate: HUBComponentChildDelegate?
    
   // var imageView:
    var layoutTraits: Set<HUBComponentLayoutTrait>{
        return [.fullWidth,.stackable]
    }
    
    func loadView()
    {
//        stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.distribution  = UIStackViewDistribution.equalSpacing
//        stackView.alignment = UIStackViewAlignment.center
//        stackView.spacing   = 16.0
    
        self.view = UIView()
        
        componentPlainView_imageView = UIImageView()
        
      //  self.view = componentPlainView_imageView
        
        self.view.backgroundColor = UIColor.cyan
        
        componentPlainView_appDelegate = UIApplication.shared.delegate as? AppDelegate
        componentPlainView_appDelegate?.component_plainview = self
    }
    
    func preferredViewSize(forDisplaying model: HUBComponentModel, containerViewSize: CGSize) -> CGSize
    {
       
        return CGSize(width: containerViewSize.width, height: 400)
    
    
    }
    
    func prepareViewForReuse()
    {
        componentPlainView_imageView = self.view as? UIImageView
        componentPlainView_imageView?.image = nil
    }
    
    func configureView(with model: HUBComponentModel, containerViewSize: CGSize)
    {
        
     //   let childModel1: HUBComponentModel = model.child(at: 0)! as! HUBComponentModel
        
        let childModel2:HUBComponentModel = model.child(at: 0)! 
               //Is it not supposed to render the child "row" component by itself by addid child's
            //view as SubView of the parents'
     //   let child1 = self.childDelegate?.component(self, childComponentFor: childModel1)
        
        let child2 = self.childDelegate?.component(self, childComponentFor: childModel2)
        debugPrint(child2)
        
        
        //Child1 view
      //  let viewCHild1 = child1?.view
        //Child2 View
        
        componentPlainView_imageView = child2?.view as! UIImageView?
        
        //Adding view of Child1
       // self.view?.addSubview(viewCHild1!)
        //Adding view of Child2 [ImageView]
        self.view?.addSubview(componentPlainView_imageView!)
        componentPlainView_imageView?.frame = CGRect(x: 0, y: 0, width: containerViewSize.width, height: 200)
        componentPlainView_imageView?.backgroundColor = UIColor.green
    
     //   let imageChild = child2 as! HUBComponentWithImageHandling
    //    viewChild2?.reloadInputViews()
        
        
        //It says this method is used to notify HubFramework about the appearance  of childView
            //What does HUbFramework actually do by knowing about it ??? 
            // Any drawbacks if I don't call this method on the delegate.
       childDelegate?.component(self, willDisplayChildAt: 0, view: componentPlainView_imageView!)
        
    //    childDelegate?.component(self, willDisplayChildAt: 1, view: viewChild2!)
       // viewChild2

        
    }
    
    //call from "preferredViewSize" to get size of children
//    func ComponentPlainView_child_height(model: HUBComponentModel,containerViewSize: CGSize)-> CGSize
//    {
//        
//    }
    
    

}
