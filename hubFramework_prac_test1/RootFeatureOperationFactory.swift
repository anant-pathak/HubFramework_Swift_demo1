//
//  RootFeatureOperationFactory.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 11/18/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit
import HubFramework
class RootFeatureOperationFactory: NSObject,HUBContentOperationFactory {
    func createContentOperations(forViewURI viewURI: URL) -> [HUBContentOperation] {
        return [RootContentOperation_list()]
    }
    
}
