//
//  FreddyContentOperation.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 12/22/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit
import HubFramework
import Freddy
class FreddyContentOperation_freddy: NSObject, HUBContentOperation {
    var delegate: HUBContentOperationDelegate?
    //timers:
    var startTime: TimeInterval?
    var endTime: TimeInterval?
    var time: TimeInterval?

    func perform(forViewURI viewURI: URL, featureInfo: HUBFeatureInfo, connectivityState: HUBConnectivityState, viewModelBuilder: HUBViewModelBuilder, previousError: Error?) {
        mapi_json_decode()
        
        delegate?.contentOperationDidFinish(self)
        
    }
    
    func mapi_json_decode()
    {
        startTime = NSDate().timeIntervalSinceReferenceDate
        let json_file_name = "mapi_full"
        let data = getJsonData(json_file_name: json_file_name)
        do
        {
            let json: JSON = try JSON(data: data!)
            let mapi_obj: Mapi_model_file = try Mapi_model_file(json: json)
           // print(mapi_obj.StatusCode)
           // print(mapi_obj.arr_products)
        }
        catch
        {
            
        }
        endTime = NSDate().timeIntervalSinceReferenceDate
        time = endTime! - startTime!
        
        print(String(describing: time))
    }
    
    func getJsonData(json_file_name: String)-> Data?
    {
        
        let jsonURL = Bundle.main.url(forResource: json_file_name, withExtension: "json")
        var data: Data?
        do
        {
            data   = try Data(contentsOf: jsonURL!)
            
        }
        catch
        {
            
        }
        return data
    }
    
    
}
