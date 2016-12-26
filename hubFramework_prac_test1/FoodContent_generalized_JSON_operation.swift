//
//  FoodContent_generalized_JSON_operation.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 11/11/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit
import HubFramework

class FoodContent_standard_JSON_operation: NSObject,HUBContentOperation {
    var delegate: HUBContentOperationDelegate?
    
    func perform(forViewURI viewURI: URL, featureInfo: HUBFeatureInfo, connectivityState: HUBConnectivityState, viewModelBuilder: HUBViewModelBuilder, previousError: Error?) {
        var json_file_name: String?
        json_file_name = "food_hubFrm_default"
        
        let jsonURL = Bundle.main.url(forResource: json_file_name, withExtension: "json")
        // Bundle.main.path(forResource: "city-images", ofType: "json")
        let jsonData = NSData(contentsOf: jsonURL!)
        do
        {
            try viewModelBuilder.addJSON(data: jsonData as! Data)
        }
        catch
        {
            
        }
       // print("Ho HO HO ")
       // print(viewModelBuilder.allBodyComponentModelBuilders()[0].title!)
        
        delegate!.contentOperationDidFinish(self)
        
    }

}
