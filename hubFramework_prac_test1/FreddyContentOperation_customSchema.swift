//
//  FreddyContentOperation_customSchema.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 12/26/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit
import HubFramework


class FreddyContentOperation_customSchema: NSObject,HUBContentOperation {
    //timers:
    var startTime: TimeInterval?
    var endTime: TimeInterval?
    var time: TimeInterval?

    var delegate: HUBContentOperationDelegate?
    func perform(forViewURI viewURI: URL, featureInfo: HUBFeatureInfo, connectivityState: HUBConnectivityState, viewModelBuilder: HUBViewModelBuilder, previousError: Error?) {
        startTime = NSDate().timeIntervalSinceReferenceDate

        
        var json_file_name: String?
        json_file_name = "mapi_full"
        
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
        let num_loop_times = viewModelBuilder.numberOfBodyComponentModelBuilders
        print("HO HO HO Merry Christmas: & number of models=>\(num_loop_times)")
//        for i in 0..<Int(num_loop_times)
//        {
//            
//            print(viewModelBuilder.allBodyComponentModelBuilders()[i].customData!)
//        }
        
        endTime = NSDate().timeIntervalSinceReferenceDate
        time = endTime! - startTime!
        print(String(describing: time))

        delegate?.contentOperationDidFinish(self)
    }
}
