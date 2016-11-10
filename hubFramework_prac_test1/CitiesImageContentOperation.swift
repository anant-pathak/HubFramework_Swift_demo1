//
//  CitiesImageContentOperation.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 11/2/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import Foundation
import UIKit
import HubFramework

class CitiesImageContentOperation: NSObject, HUBContentOperation {
    var delegate: HUBContentOperationDelegate?
    
    func perform(forViewURI viewURI: URL, featureInfo: HUBFeatureInfo, connectivityState: HUBConnectivityState, viewModelBuilder: HUBViewModelBuilder, previousError: Error?) {
        let jsonURL = Bundle.main.url(forResource: "city-images", withExtension: "json")
        // Bundle.main.path(forResource: "city-images", ofType: "json")
        let jsonData = NSData(contentsOf: jsonURL!)
        viewModelBuilder.addJSONData(jsonData as! Data)
        delegate!.contentOperationDidFinish(self)

    }
}
