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
    var delegate: HUBContentOperationDelegate?
    func perform(forViewURI viewURI: URL, featureInfo: HUBFeatureInfo, connectivityState: HUBConnectivityState, viewModelBuilder: HUBViewModelBuilder, previousError: Error?) {
        
        
        delegate?.contentOperationDidFinish(self)
    }
}
