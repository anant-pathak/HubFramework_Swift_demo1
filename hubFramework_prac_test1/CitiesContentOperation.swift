//
//  CitiesContentOperation.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 10/26/16.
//  Copyright © 2016 Anant. All rights reserved.
//



import Foundation
import HubFramework

class CitiesContentOperation: NSObject , HUBContentOperation, HUBContentOperationActionObserver{
    /**
     *  Sent to a content operation whenever an action was performed in the view that it is being used in
     *
     *  @param context The contextual object that the action was performed with
     *  @param featureInfo The information for the feature that the action was performed in
     *  @param connectivityState The current connectivity state of the application
     *
     *  The Hub Framework will call this method on your content operation every time that an action was performed
     *  in the view that it is being used in, including both default selection actions & custom ones. You can
     *  use this method to mutate a content operation's state, and then reschedule it to be able to manipulate the
     *  content that is being displayed in the view.
     */
    
    //Action Observer
        //When a component calls for an Action which happens in a view that has this content operation as well.
    
    var cities:[String] = ["Madrid", "Rome", "Berlin", "Amsterdam"]
    var countries:[String: String] = ["Madrid":"Spain", "Rome":"Italy", "Berlin":"Germany", "Amsterdam":"Netherlands"]
 //   var arr_models:[]
    
    
    weak var delegate: HUBContentOperationDelegate?
    
    func perform(forViewURI viewURI: URL, featureInfo: HUBFeatureInfo, connectivityState: HUBConnectivityState, viewModelBuilder: HUBViewModelBuilder, previousError: Error?) {
        print("here1")
//        let citiesRowBuilder = viewModelBuilder.builderForBodyComponentModel(withIdentifier: "cities")
//        citiesRowBuilder.title = "Cities"
//        citiesRowBuilder.subtitle = "A feature that renders beautiful cities:citiesAction"
//        citiesRowBuilder.targetBuilder.uri = URL(string: "cities:overview")
//        
        viewModelBuilder.navigationBarTitle = featureInfo.title
        //MARK: Data for model
        
        //1) Button Component Model
        let buttonBuilder: HUBComponentModelBuilder = viewModelBuilder.builderForBodyComponentModel(withIdentifier: "button-1")
        buttonBuilder.componentNamespace = "cities"
        buttonBuilder.componentName = "button"
        buttonBuilder.title = "delete ME"
    
        
        //2) Row Component Models
        for (index,city) in cities.enumerated()
        {
            let identifier:String = "city-"+String(index)
            var rowBuilder:HUBComponentModelBuilder = viewModelBuilder.builderForBodyComponentModel(withIdentifier: identifier)
            rowBuilder.componentNamespace = "cities"
            rowBuilder.componentName = "row"
            rowBuilder.targetBuilder.addAction(withNamespace: "cities", name: "citiesAction")
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
        
        //3
        var rowBuilder:HUBComponentModelBuilder = viewModelBuilder.builderForBodyComponentModel(withIdentifier: "row-image")
        rowBuilder.componentNamespace = "cities"
        rowBuilder.componentName = "banner"
        rowBuilder.title = "lucknow"
        let lkoImage: UIImage = UIImage(named: "lucknow1")!
       
        rowBuilder.mainImageDataBuilder.localImage = lkoImage
        
        //4 Carousel Builder
        let carouselBuilder:HUBComponentModelBuilder = viewModelBuilder.builderForBodyComponentModel(withIdentifier: "carousel1")
        carouselBuilder.componentNamespace = "cities"
        carouselBuilder.componentName = "carousel"
        carouselBuilder.title = "lucknow"
            
        
        let carouselBuilder_child1:HUBComponentModelBuilder = carouselBuilder.builderForChild(withIdentifier: "carousel1-1")
        carouselBuilder_child1.componentNamespace = "cities"
        carouselBuilder_child1.componentName = "collectionViewCell"
        carouselBuilder_child1.title = "Anant"
        carouselBuilder_child1.subtitle = "TheBiker"
    
        
        //5 collectionViewCell Builder
        
        let collectionCellBuilder:HUBComponentModelBuilder = viewModelBuilder.builderForBodyComponentModel(withIdentifier: "collectionCell-1")
        collectionCellBuilder.componentNamespace = "cities"
        collectionCellBuilder.componentName = "collectionViewCell"
        collectionCellBuilder.title = "Anant"
        collectionCellBuilder.subtitle = "TheBiker"
       
//        var child1:HUBComponentModelBuilder = rowBuilder.builderForChild(withIdentifier: "carousel1-1")
//        child1.componentName = ""
        
        
//        var rowBuilder: HUBComponentModelBuilder =  viewModelBuilder.builderForBodyComponentModel(withIdentifier: "row-0") //Create a Component Model Builder with a name "row-0" if it doesn't exist already else creates a new 1.
//        rowBuilder.componentNamespace = "cities"
//        rowBuilder.componentName = "row"
//        rowBuilder.title = "Hello world"
//        rowBuilder.subtitle = "This is my first component"
        
        delegate!.contentOperationDidFinish(self)
    }
    
    public func actionPerformed(with context: HUBActionContext, featureInfo: HUBFeatureInfo, connectivityState: HUBConnectivityState) {
        let citiesActionIdent: HUBIdentifier = HUBIdentifier(namespace: "cities", name:"citiesAction")
        
        if (context.customActionIdentifier == citiesActionIdent)
        {
            cities.append("delhi")
            countries["delhi"] = "India"
            print(countries)
            print("reloading")
            delegate?.contentOperationRequiresRescheduling(self)
            
            
        }
        
    }

    
    
    
}
