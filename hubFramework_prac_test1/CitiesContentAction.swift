//
//  CitiesContentAction.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 12/5/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit
import HubFramework
class CitiesContentAction: NSObject,HUBAction{

    func perform(with context: HUBActionContext) -> Bool {
        print(context.componentModel?.title)
        print(type(of:context.componentModel))
        
       // context.componentModel.
        return true
    }
}
