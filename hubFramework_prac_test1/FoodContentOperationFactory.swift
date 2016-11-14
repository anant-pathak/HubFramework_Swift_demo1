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
        return [FoodContent_generalized_JSON_operation()]
    }
}
