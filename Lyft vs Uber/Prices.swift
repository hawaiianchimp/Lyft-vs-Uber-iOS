//
//  Prices.swift
//  Lyft vs Uber
//
//  Created by Sean Thomas Burke on 3/19/15.
//  Copyright (c) 2015 Nyquist Labs. All rights reserved.
//

import Foundation
import Parse

class Prices {
    var priceDictionary: Dictionary<String, Price>
    
    init(cityName: String){
        var queryCity = PFQuery(className: "City")
        queryCity.whereKey("name", equalTo: cityName)
        let pfcity = queryCity.getFirstObject()
        println(pfcity);
        var priceRelation: PFRelation = pfcity.relationForKey("prices")
        
        
        println(priceRelation);
        var queryPrices = priceRelation.query()
        
        var prices = queryPrices.findObjects();
        
        var tempDictionary = Dictionary<String, Price>();
        for price in prices{
            tempDictionary.updateValue(
                Price(
                    mile: price["mile"] as Double,
                    minute: price["minute"] as Double,
                    extra: price["extra"] as Double,
                    base: price["base"] as Double,
                    minimum: price["minimum"] as Double
                ),
                forKey: price["size"] as String
            )
            println(price)
        }
        
       
        
        self.priceDictionary = tempDictionary
        println(self.priceDictionary["Lyft Plus"])
    }
}