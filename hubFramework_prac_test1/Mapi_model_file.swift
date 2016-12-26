//
//  Mapi_model_file.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 12/24/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit
import Freddy
//let BaseProductId":"53426251",
//let EANBarcode":"0000010063125",
//let CheaperAlternativeProductIdlet :"",
//let HealthierAlternativeProductId":"",
//"ImagePath":"https://img.tesco.com/Groceries/pi/125/0000010063125/IDShot_90x90.jpg",
//"AlternativeImages":[
//{
//"Name":"ID Shot",
//"ThumbImageUrl":"https://img.tesco.com/Groceries/pi/125/0000010063125/IDShot_90x90.jpg",
//"HighestResolutionUrl":"https://img.tesco.com/Groceries/pi/125/0000010063125/IDShot_540x540.jpg"
//},
//{
//"Name":"Out of Pack/ Lid off",
//"ThumbImageUrl":"https://img.tesco.com/Groceries/pi/125/0000010063125/OutofPack/Lidoff_225x225.jpg",
//"HighestResolutionUrl":"https://img.tesco.com/Groceries/pi/125/0000010063125/OutofPack/Lidoff_540x540.jpg"
//}
//],
//"MaximumPurchaseQuantity":99,
//"Name":"Tesco Cranberries 100G",
//"OfferPromotion":"Half Price Was £1.50 Now 75p",
//"OfferValidity":"valid from 7/12/2016 until 27/12/2016",
//"OfferLabelImagePath":"https://www.tesco.com/Groceries/UIAssets/I/Sites/Retail/Superstore/Online/Product/pos/halfprice.png",
//"OfferID":"A32119700",
//"OfferValidFrom":"2016-12-07",
//"OfferValidUntil":"2016-12-27",
//"Price":0.75,
//"PriceDescription":" (£7.50/kg)",
//"ProductId":"257399828",
//"ProductType":"QuantityOnlyProduct",
//"IsNew":"False",
//"IsFavourite":"False",
//"UnitPrice":7.50,
//"CarbonDataAvailable":0,
//"AddEnabled":"Y",
//"DeleteEnabled":"Y",
//"Message":"",
//"UnitType":"kg",
//"ExtendedInfoUrl":"https://mobile.tesco.com/Embed/product/257399828"
//},

//"CatchWeight": 2.7,
//"CatchWeightList":
//[
//{
//"Price": "£20.90",
//"Weight": 2.2
//},
//{
//"Price": "£23.28",
//"Weight": 2.45
//},
//{
//"Price": "£25.65",
//"Weight": 2.7
//}
//],


struct Alternate_images
{
    let Name : String
    let ThumbImageUrl: String
    let HighestResolutionUrl: String
}

extension Alternate_images: JSONDecodable
{
    public  init(json: JSON) throws {
        Name = try json.getString(at: "Name")
        ThumbImageUrl = try json.getString(at: "ThumbImageUrl")
        HighestResolutionUrl = try json.getString(at: "HighestResolutionUrl")
    }
}

struct CatchWeightList
{
    let Price: String
    let Weight: String
}

extension CatchWeightList: JSONDecodable
{
    
    public init(json: JSON) throws {
        Price = try json.getString(at: "Price")
        Weight = try json.getString(at: "Weight")
    }
}


struct Product
{
    let BaseProductId: String
    let EANBarcode: String
    let CheaperAlternativeProductId: String
    let HealthierAlternativeProductId: String
    let ImagePath: String
    let arr_Alternate_images: [Alternate_images]
    let MaximumPurchaseQuantity : String
    let Name: String
    let OfferPromotion: String
    let OfferValidity: String
    let OfferLabelImagePath: String
    let OfferID: String //ALphaNUmeric
    let OfferValidFrom: String
    let OfferValidUntil: String
    let Price : String
    let PriceDescription:  String
    let ProductId: String
    let ProductType: String //Could be an Enum
    let IsNew: String
    let IsFavourite: String
    let UnitPrice : String
    let CarbonDataAvailable : String
    let AddEnabled: String
    let DeleteEnabled: String
    let Message: String
    //   let CatchWeight: String //This key isn't present in all of the Objects
    //   let arr_CatchWeightList: [CatchWeightList] //This key isn't present in all of the Objects
    let UnitType: String
    let ExtendedInfoUrl: String
}




struct Mapi_model_file
{
    let StatusCode: String
    //  let  StatusInfo: String
    //    let  IsFavouritesFilterAvailable: Bool
    //    let IsNewProductFilterAvailable: Bool
    //    let PageNumber: String
    //   let TotalPageCount: String
    //   let TotalProductCount: String
    //   let PageProductCount: String
    var arr_products: [Product]
    
}

extension Product: JSONDecodable
{
    public init(json: JSON) throws {
        BaseProductId = try json.getString(at: "BaseProductId")
        EANBarcode = try json.getString(at: "EANBarcode")
        CheaperAlternativeProductId = try json.getString(at: "CheaperAlternativeProductId")
        HealthierAlternativeProductId = try json.getString(at: "HealthierAlternativeProductId")
        ImagePath = try json.getString(at : "ImagePath")
        arr_Alternate_images = try json.decodedArray(at: "AlternativeImages", type: Alternate_images.self)
        MaximumPurchaseQuantity  = try json.getString(at : "MaximumPurchaseQuantity")
        Name = try json.getString(at : "Name")
        OfferPromotion = try json.getString(at : "OfferPromotion")
        OfferValidity = try json.getString(at : "OfferValidity")
        OfferLabelImagePath = try json.getString(at : "OfferLabelImagePath")
        OfferID = try json.getString(at : "OfferID") //ALphaNUmeric
        OfferValidFrom = try json.getString(at : "OfferValidFrom")
        OfferValidUntil = try json.getString(at : "OfferValidUntil")
        Price  = try json.getString(at : "Price")
        PriceDescription = try json.getString(at : "PriceDescription")
        ProductId = try json.getString(at : "ProductId")
        ProductType = try json.getString(at : "ProductType") //Could be an Enum
        IsNew = try json.getString(at : "IsNew")
        IsFavourite = try json.getString(at : "IsFavourite")
        UnitPrice  = try json.getString(at : "UnitPrice")
        CarbonDataAvailable  = try json.getString(at : "CarbonDataAvailable")
        AddEnabled = try json.getString(at : "AddEnabled")
        DeleteEnabled = try json.getString(at : "DeleteEnabled")
        Message = try json.getString(at : "Message")
        //  CatchWeight = try json.getString(at : "CatchWeight")
        //  arr_CatchWeightList = try json.decodedArray(at: "CatchWeightList",type: CatchWeightList.self)
        UnitType = try json.getString(at : "UnitType")
        ExtendedInfoUrl = try json.getString(at : "ExtendedInfoUrl")
    }
}

extension Mapi_model_file: JSONDecodable
{
    public init(json: JSON) throws
    {
        StatusCode = try json.getString(at: "StatusCode")
        
        arr_products = try json.decodedArray(at: "Products", type: Product.self )
        //    arr_products = try json.getArray(at: "Products") as! [Product]
        
    }
}

