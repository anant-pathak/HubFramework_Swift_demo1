//
//  CitiesContentOperation.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 10/26/16.
//  Copyright © 2016 Anant. All rights reserved.
//



import Foundation
import HubFramework

class CitiesContentOperation: NSObject , HUBContentOperation{
    weak var delegate: HUBContentOperationDelegate?
    
    func perform(forViewURI viewURI: URL, featureInfo: HUBFeatureInfo, connectivityState: HUBConnectivityState, viewModelBuilder: HUBViewModelBuilder, previousError: Error?) {
        print("here1")
//        let citiesRowBuilder = viewModelBuilder.builderForBodyComponentModel(withIdentifier: "cities")
//        citiesRowBuilder.title = "Cities"
//        citiesRowBuilder.subtitle = "A feature that renders beautiful cities"
//        citiesRowBuilder.targetBuilder.uri = URL(string: "cities:overview")
//        
        viewModelBuilder.navigationBarTitle = featureInfo.title
        //MARK: Data for model
        let cities:[String] = ["Madrid", "Rome", "Berlin", "Amsterdam"]
        let countries:[String: String] = ["Madrid":"Spain", "Rome":"Italy", "Berlin":"Germany", "Amsterdam":"Netherlands"]
        
        for (index,city) in cities.enumerated()
        {
            let identifier:String = "city-"+String(index)
            var rowBuilder:HUBComponentModelBuilder = viewModelBuilder.builderForBodyComponentModel(withIdentifier: identifier)
            rowBuilder.componentNamespace = "cities"
            rowBuilder.componentName = "row"
            rowBuilder.title = city
            /*
             IF YOU WISH TO USE LOCAL IMAGES THEN FOLLOW:
             
              rowBuilder.mainImageDataBuilder.localImage = nil 
             & then in component file : model.mainImageData
             */
         //
            guard let capital = countries[city] else{
                return
            }
            rowBuilder.subtitle = capital //"capital" in guard can be accessed in the block in which guard is defined
            
            
        }
        
        var rowBuilder:HUBComponentModelBuilder = viewModelBuilder.builderForBodyComponentModel(withIdentifier: "row-image")
        rowBuilder.componentNamespace = "cities"
        rowBuilder.componentName = "banner"
        rowBuilder.title = "lucknow"
        let lkoImage: UIImage = UIImage(named: "lucknow")!
        rowBuilder.mainImageDataBuilder.localImage = lkoImage
        
        
        
//        var rowBuilder: HUBComponentModelBuilder =  viewModelBuilder.builderForBodyComponentModel(withIdentifier: "row-0") //Create a Component Model Builder with a name "row-0" if it doesn't exist already else creates a new 1.
//        rowBuilder.componentNamespace = "cities"
//        rowBuilder.componentName = "row"
//        rowBuilder.title = "Hello world"
//        rowBuilder.subtitle = "This is my first component"
        
        delegate!.contentOperationDidFinish(self)
    }
    
}
