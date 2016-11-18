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
        let home_uri = URL(string: "cities:overview") //PICTURES without children
        let gitHubSearchRowBuilder = viewModelBuilder.builderForBodyComponentModel(withIdentifier: "gitHubSearch")
        gitHubSearchRowBuilder.title = "Cities"
        gitHubSearchRowBuilder.subtitle = "Cities Feature"
        gitHubSearchRowBuilder.targetBuilder.uri = home_uri
        
        let food_uri = URL(string: "cities:food") //picture with children
        let prettyPicturesRowBuilder = viewModelBuilder.builderForBodyComponentModel(withIdentifier: "prettyPictures")
        prettyPicturesRowBuilder.title = "Food"
        prettyPicturesRowBuilder.subtitle = "Food Feature"
        prettyPicturesRowBuilder.targetBuilder.uri = food_uri
        
//        let reallyLongListRowBuilder = viewModelBuilder.builderForBodyComponentModel(withIdentifier: "reallyLongList")
//        reallyLongListRowBuilder.title = "Really long list"
//        reallyLongListRowBuilder.subtitle = "A feature that renders 10,000 rows"
//        reallyLongListRowBuilder.targetBuilder.uri = .reallyLongListViewURI
//        
//        let todoListRowBuilder = viewModelBuilder.builderForBodyComponentModel(withIdentifier: "todoList")
//        todoListRowBuilder.title = "Todo list"
//        todoListRowBuilder.subtitle = "A feature for adding todo items to a list"
//        todoListRowBuilder.targetBuilder.uri = .todoListViewURI
//        
        delegate?.contentOperationDidFinish(self)

    }
}
