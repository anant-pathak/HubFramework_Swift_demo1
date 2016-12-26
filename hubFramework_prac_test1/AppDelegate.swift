//
//  AppDelegate.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 10/25/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit
import HubFramework
import Foundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var component_plainview: ComponentPlainView?
    var hubManager: HUBManager!
    var navigationController: UINavigationController!
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //1 hubManager instance & navigationController
        hubManager = HUBManager(componentLayoutManager: HUBComponentLayoutManager1(), componentFallbackHandler: ComponentFallbackHandler() )
        navigationController = UINavigationController()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        
        window?.makeKeyAndVisible()
        //MARK: 2 setting up a feature:
        
//        //2.1 Feature Cities
        hubManager.featureRegistry.registerFeature(
            withIdentifier: "cities",
            viewURIPredicate: HUBViewURIPredicate(viewURI: Util_URI.url_feature_cities)  ,
            title: "cities",
            contentOperationFactories: [CitiesContentOperationFactory()],
            contentReloadPolicy: nil,
            customJSONSchemaIdentifier: nil,
            actionHandler: nil,
            viewControllerScrollHandler: nil)
        
        //2.2 Feature Food with Custom JSON
        hubManager.featureRegistry.registerFeature(
            withIdentifier: "food_custom_JSON",
            viewURIPredicate: HUBViewURIPredicate(viewURI: Util_URI.url_feature_food_custom_JSON)  ,
            title: "food",
            contentOperationFactories: [FoodContentOperationFactory()],
            contentReloadPolicy: nil,
            customJSONSchemaIdentifier: hubManager.jsonSchemaRegistry.bannerSchemaId, //NOTE MAKE IT NIL IF TRYING TO PARSE A NORMAL JSON FILE
            actionHandler: nil,
            viewControllerScrollHandler: nil)
            //For the above "FOOD" feature lets register the custom JSON schema
            hubManager.jsonSchemaRegistry.registerBannerSchema()
        
        //2.3 Feature Food with standard JSON
        hubManager.featureRegistry.registerFeature(
            withIdentifier: "food_standard_JSON",
            viewURIPredicate: HUBViewURIPredicate(viewURI: Util_URI.url_feature_food_standard_JSON)  ,
            title: "food",
            contentOperationFactories: [FoodContentOperationFactory()],
            contentReloadPolicy: nil,
            customJSONSchemaIdentifier: nil, //NOTE MAKE IT NIL IF TRYING TO PARSE A NORMAL JSON FILE
            actionHandler: nil,
            viewControllerScrollHandler: nil)
        

        
        //2.4 Root Feature regirtry
        hubManager.featureRegistry.registerFeature(
            withIdentifier: "root",
            viewURIPredicate: HUBViewURIPredicate(viewURI: Util_URI.url_feature_root_home),
            title: "Root feature",
            contentOperationFactories: [RootFeatureOperationFactory()],
            contentReloadPolicy: nil,
            customJSONSchemaIdentifier: nil,
            actionHandler: nil,
            viewControllerScrollHandler: nil
        )
        
        //2.5 Freddy Feature Registry
        hubManager.featureRegistry.registerFeature(
            withIdentifier: "freddy",
            viewURIPredicate: HUBViewURIPredicate(viewURI: Util_URI.url_feature_freddy),
            title: "Freddy feature",
            contentOperationFactories: [FreddyContentOperationFactory()],
            contentReloadPolicy: nil,
            customJSONSchemaIdentifier: nil,
            actionHandler: nil,
            viewControllerScrollHandler: nil
        )

        
        
        //3 opening the viewController
//        let citiesRowBuilder = viewModelBuilder.builderForBodyComponentModel(withIdentifier: "cities")
//        citiesRowBuilder.title = "Cities"
//        citiesRowBuilder.subtitle = "A feature that renders beautiful cities"
//        citiesRowBuilder.targetBuilder.uri = URL(viewURI: "cities:overview")
        
        //MARK:4 Setting up a factory -> component
        registerComponentFactory()
        
        //MARK: 5 Registering Action Factory:
        registerActionFactory()
        
        //Calling a featue to open it:
        var feature_call_uri: URL?
        //feature_call_uri = home_uri
        //feature_call_uri = food_uri
        feature_call_uri = Util_URI.url_feature_root_home
        if openView_custom(open: feature_call_uri!)
        {
            print("view successfully opened")
        }else
        {
            print("view couldn't be opned")
        }
        
        //4 Setting up a factory -> component
        
        return true
    }
    
    func registerActionFactory()
    {
        self.hubManager.actionRegistry.register(CitiesContentActionFactory(), forNamespace: "cities")
    }
    
    func registerComponentFactory()
    {
        self.hubManager.componentRegistry.register(componentFactory: ComponentFactory(), namespace: "cities")
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    //MARK: URL handler
    //URL handler to handle URL matching that information will be routed to your app delegate’s application:openURL:options: method. This is an ideal place to perform the actual navigation.
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        guard let viewCont = self.hubManager.viewControllerFactory.createViewController(forViewURI: url) else {
            return false
        }
        viewCont.view.backgroundColor = UIColor.white
        navigationController.pushViewController(viewCont, animated: true)
        
        return true
    }
    
    //When we pass a feature URL, contentOperationFactory specified in association with that feature will load up & in turn the ContentsOperation & ComponentModels & Component
    func openView_custom(open url: URL)-> Bool{
        guard let viewCont = hubManager?.viewControllerFactory.createViewController(forViewURI: url) else {
            return false
        }
       // print(type(of:viewCont))
        print("url " + url.absoluteString)
        viewCont.view.backgroundColor = UIColor.white
        navigationController?.pushViewController(viewCont, animated: false)
        
        return true
    }


}

