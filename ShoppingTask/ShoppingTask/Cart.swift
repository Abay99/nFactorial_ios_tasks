//
//  Cart.swift
//  ShoppingTask
//
//  Created by Abai Kalikov on 6/26/18.
//  Copyright © 2018 Abai Kalikov. All rights reserved.
//

import Foundation

class Cart {
    
    static var cart_arr: [Product] = []
    
    let products: [Product]
    
    init(products: [Product]) {
        self.products = products
    }
    
    func show(products: [Product]){
        for product in products{
            if(!(products.isEmpty)){
                print("\(product.Id). \(product.Product_name) \(product.Price)")
            }else{
                continue
            }
        }
    }
    
}
