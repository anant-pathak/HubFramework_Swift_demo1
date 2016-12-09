//
//  FoodContent_generalized_JSON_operation.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 11/11/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit
import HubFramework

class FoodContent_generalized_JSON_operation: NSObject,HUBContentOperation {
    var delegate: HUBContentOperationDelegate?
    
    func perform(forViewURI viewURI: URL, featureInfo: HUBFeatureInfo, connectivityState: HUBConnectivityState, viewModelBuilder: HUBViewModelBuilder, previousError: Error?) {
        var json_file_name: String?
        json_file_name = "food_hubFrm_default"
     //   json_file_name = "dcs-json"
        
        let jsonURL = Bundle.main.url(forResource: json_file_name, withExtension: "json")
        // Bundle.main.path(forResource: "city-images", ofType: "json")
        let jsonData = NSData(contentsOf: jsonURL!)
        viewModelBuilder.addJSONData(jsonData as! Data)
        delegate!.contentOperationDidFinish(self)
        
    }

}
