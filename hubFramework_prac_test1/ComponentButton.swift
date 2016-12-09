//
//  ComponentButton.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 12/5/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit
import HubFramework
class ComponentButton: NSObject, HUBComponent,HUBComponentActionPerformer,UIGestureRecognizerDelegate{
    var view: UIView? //The view that out component is about to create & its
    
  
    var actionPerformer: HUBActionPerformer?
    // weak var actionPerformer: HUBActionPerformer?
    var button: UIButton!
    //
    var layoutTraits: Set<HUBComponentLayoutTrait>{
        return [.centered]
    }
    
    func loadView()
    {
        button = UIButton(type: .roundedRect)
        button.backgroundColor = UIColor.cyan
    
        self.view = button
    }
    
    func preferredViewSize(forDisplaying model: HUBComponentModel, containerViewSize: CGSize) -> CGSize {
        return CGSize(width: containerViewSize.width/2, height: 30)
    }
    
    func prepareViewForReuse() {
        
    }
    
    func configureView(with model: HUBComponentModel, containerViewSize: CGSize) {
      //Setting title from the model for view encapsulating the Button
        (self.view as? UIButton)?.setTitle(model.title, for: .normal)
       // print((self.view as! UIButton).titleLabel?.text)
        //
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.componentButton_ButtonTapped(_:)))
        tap.delegate = self
        self.view?.addGestureRecognizer(tap)
        
        
    }
    
    func componentButton_ButtonTapped(_ gestureRecognizer: UIGestureRecognizer)
    {
        let actionIdentifier: HUBIdentifier = HUBIdentifier(string: "cities:citiesAction")!
        actionPerformer?.performAction(withIdentifier: actionIdentifier, customData: nil)
        print("button_tapped_successfully")
    }
    
    

}
