//
//  CitiesContentOperationFactory.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 10/27/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit
import HubFramework

class CitiesContentOperationFactory: NSObject, HUBContentOperationFactory{
    func createContentOperations(forViewURI viewURI: URL) -> [HUBContentOperation] {
        return [CitiesContentOperation(),CitiesImageContentOperation()]
        
    }
    
}
