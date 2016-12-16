//
//  RootContentOperation_list.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 11/18/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit
import HubFramework
class RootContentOperation_list: NSObject,HUBContentOperation {
    var delegate: HUBContentOperationDelegate?
    func perform(forViewURI viewURI: URL, featureInfo: HUBFeatureInfo, connectivityState: HUBConnectivityState, viewModelBuilder: HUBViewModelBuilder, previousError: Error?) {
        
        viewModelBuilder.navigationBarTitle = "Hub Framework Demo App"
        
        //1. Cities Page
        let citiesRowBuilder = viewModelBuilder.builderForBodyComponentModel(withIdentifier: "root_row_cities")
        citiesRowBuilder.componentNamespace = "cities"
        citiesRowBuilder.componentName = "row"
        citiesRowBuilder.title = "Cities"
        citiesRowBuilder.subtitle = "Cities Feature"
        citiesRowBuilder.targetBuilder.uri = Util_URI.url_feature_cities
        
        //2. Food_custom_JSON Page
        let prettyPicturesRowBuilder = viewModelBuilder.builderForBodyComponentModel(withIdentifier: "root_row_food")
        prettyPicturesRowBuilder.componentNamespace = "cities"
        prettyPicturesRowBuilder.componentName = "row"
        prettyPicturesRowBuilder.title = "Food"
        prettyPicturesRowBuilder.subtitle = "Food Feature with Custom JSON"
        prettyPicturesRowBuilder.targetBuilder.uri = Util_URI.url_feature_food_custom_JSON
        
        //3 Food Standard JSON Page
        let prettyPicturesRowBuilder2 = viewModelBuilder.builderForBodyComponentModel(withIdentifier: "root_row_food2")
        prettyPicturesRowBuilder2.componentNamespace = "cities"
        prettyPicturesRowBuilder2.componentName = "row"
        prettyPicturesRowBuilder2.title = "Food"
        prettyPicturesRowBuilder2.subtitle = "Food Feature with standard JSON"
        prettyPicturesRowBuilder2.targetBuilder.uri = Util_URI.url_feature_food_standard_JSON
        delegate?.contentOperationDidFinish(self)

    }
}
