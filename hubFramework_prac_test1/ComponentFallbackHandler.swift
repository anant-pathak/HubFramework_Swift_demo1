//
//  ComponentFallbackHandler.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 10/26/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit
import HubFramework

class ComponentFallbackHandler: NSObject, HUBComponentFallbackHandler {

    var defaultComponentNamespace: String {
       // return defaultComponentCategory.namespace
        return ""
    }
    
    var defaultComponentName: String {
       // return defaultComponentName.row
        return ""
    }
    
    var defaultComponentCategory: HUBComponentCategory {
        return .row
    }
    
    func createFallbackComponent(forCategory componentCategory: HUBComponentCategory) -> HUBComponent {
//        if componentCategory == .card {
//            return ImageComponent()
//        }
//        
//        return RowComponent()
        return CitiesContentOperation() as! HUBComponent
    }

}
