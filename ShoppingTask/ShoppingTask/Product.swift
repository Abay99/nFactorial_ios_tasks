//
//  Product.swift
//  ShoppingTask
//
//  Created by Abai Kalikov on 6/26/18.
//  Copyright © 2018 Abai Kalikov. All rights reserved.
//

import Foundation
class Product {
    var id: Int
    var product_name: String
    var price: Int
    
    init(id: Int, product_name:String, price:Int) {
        self.id = id
        self.product_name = product_name
        self.price = price
    }
    
    var Id: Int{
        get{
            return id
        }
    }
    
    var Product_name: String{
        get{
            return product_name
        }
    }
    
    var Price: Int{
        get{
            return price
        }
    }
    
}

