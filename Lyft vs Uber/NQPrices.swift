//
//  Prices.swift
//  Lyft vs Uber
//
//  Created by Sean Thomas Burke on 3/19/15.
//  Copyright (c) 2015 Nyquist Labs. All rights reserved.
//

import Foundation
import Parse

class NQPrices {
    var priceDictionary: Dictionary<String, NQPrice>
    
    init(){
        priceDictionary = Dictionary<String, NQPrice>()
    }
    
    init(cityName: String){
        self.priceDictionary = Dictionary<String, NQPrice>()
        var queryCity = PFQuery(className: "City")
        
        
        
        queryCity.whereKey("name", equalTo: cityName)
        queryCity.getFirstObjectInBackgroundWithBlock { (pfcity: PFObject!, error: NSError!) -> Void in
            if(error?.code > 0){
                println("Error \(error.code): \(error.debugDescription)")
            }
            else if(pfcity != nil){
                println(pfcity)
                var priceRelation: PFRelation = pfcity.relationForKey("prices")
                println(priceRelation)
                var queryPrices = priceRelation.query()
                queryPrices.findObjectsInBackgroundWithBlock({ (prices: [AnyObject]!, error: NSError!) -> Void in
                    
                    if(error?.code > 0){
                        println("Error \(error.code): \(error.debugDescription)")
                    }
                    else if(prices.count > 0){
                        var tempDictionary = Dictionary<String, NQPrice>();
                        for price in prices{
                            println(price);
                            self.priceDictionary[price["size"] as String] = NQPrice(price: price as PFObject)
                        }
                    }
                })
                
            }
        }
    }
    
    func getPriceForSize(vehicle: String) -> NQPrice {
        return self.priceDictionary[vehicle]!
    }
    
}