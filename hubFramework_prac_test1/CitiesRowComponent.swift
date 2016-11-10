//
//  CitiesRowComponent.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 10/28/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit
import HubFramework
class CitiesRowComponent: NSObject, HUBComponent {
    var view: UIView? //The view that out component is about to create & its
    
    var cell:UITableViewCell! //imp: Always make it unwrapped or optional else the class wont get initialized
    //
    var layoutTraits: Set<HUBComponentLayoutTrait>{
        return [.fullWidth,.stackable]
    }
    
    func loadView()
    {
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        self.view = cell
    }
    
    func preferredViewSize(forDisplaying model: HUBComponentModel, containerViewSize: CGSize) -> CGSize {
        return CGSize(width: containerViewSize.width, height: 50)
    }
    
    func prepareViewForReuse() {
        let cell: UITableViewCell = self.view as! UITableViewCell
        cell.prepareForReuse()
    }
    
    func configureView(with model: HUBComponentModel, containerViewSize: CGSize) {
        var cell: UITableViewCell = self.view as! UITableViewCell
        cell.textLabel?.text = model.title
        cell.detailTextLabel?.text = model.subtitle
        
       
       print(model.customData?["mapiURL"])
        
        
    }
    
    
    
}
