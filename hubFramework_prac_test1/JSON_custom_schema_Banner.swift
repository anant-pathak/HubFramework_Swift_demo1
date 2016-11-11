//
//  JSON_custom_schema_Banner.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 11/11/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import Foundation
import HubFramework

extension HUBJSONSchemaRegistry{
    var bannerSchemaId: String {return "banner1"}
    
    func registerBannerSchema(){
        //Creating Custom schema "createNewSchema()" will return us the default schema; we need to modify it.
        let schema = createNewSchema()
        //Define where the body of the schema will be. & we want every Model to be parsed under body.
        schema.viewModelSchema.bodyComponentModelDictionariesPath = schema.createNewPath().go(to: "content").forEach().dictionaryPath()
        //Tell when its inside a MOdel where to look for "componet.Id":
        schema.componentModelSchema.componentIdentifierPath = schema.createNewPath().go(to: "type").stringPath()
        //Tell when its inside a model where to look for children:
        schema.componentModelSchema.childDictionariesPath = schema.createNewPath().go(to: "children").forEach().dictionaryPath()
        //When its inside of a Model where to look for a Title
        schema.componentModelSchema.titlePath = schema.createNewPath().go(to: "heading").stringPath()
        //WHere to look for an mainImage:
        schema.componentModelSchema.mainImageDataDictionaryPath = schema.createNewPath().go(to: "resource").dictionaryPath()
        //When inside of a Image.main where to look for
        schema.componentImageDataSchema.urlPath = schema.createNewPath().go(to: "image").urlPath()
        
        registerCustomSchema(schema, forIdentifier: bannerSchemaId)
        
        
    }
}
