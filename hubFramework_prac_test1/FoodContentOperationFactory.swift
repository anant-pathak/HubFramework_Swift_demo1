//
//  FoodContentOperationFactory.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 11/11/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit
import HubFramework

class FoodContentOperationFactory: NSObject, HUBContentOperationFactory {
    func createContentOperations(forViewURI viewURI: URL) -> [HUBContentOperation] {
        if(viewURI == Util_URI.url_feature_food_custom_JSON)
        {
            return [FoodContent_custom_JSON_operation()]
        }
        else if(viewURI == Util_URI.url_feature_food_standard_JSON)
        {
            return [FoodContent_standard_JSON_operation()]
        }
        //default: return FoodContent_standard_JSON_operation()
        return [FoodContent_standard_JSON_operation()]
    }
}
