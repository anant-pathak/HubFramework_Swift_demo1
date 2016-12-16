//
//  CitiesContentActionFactory.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 12/5/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit
import HubFramework

class CitiesContentActionFactory: NSObject,HUBActionFactory{
    
    func createAction(forName name: String) -> HUBAction?
    {
        if name == "citiesAction"
        {
            return CitiesContentAction()
            
        }
        
        return nil
    }
    

}
