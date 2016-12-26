//
//  FreddyContentOperationFactory.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 12/22/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit
import HubFramework
class FreddyContentOperationFactory: NSObject, HUBContentOperationFactory {
    func createContentOperations(forViewURI viewURI: URL) -> [HUBContentOperation] {
        
        if(viewURI == Util_URI.url_feature_freddy_CustomSchema)
        {
            return [FreddyContentOperation_customSchema()]
        }
        if(viewURI == Util_URI.url_feature_freddy_DataModels)
        {
            return [FreddyContentOperation_freddy()]
        }
        //Default one:
       return [FreddyContentOperation_freddy()]
    }
}
