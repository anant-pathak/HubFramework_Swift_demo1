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
        return [FreddyContentOperation_freddy()]
    }
}
