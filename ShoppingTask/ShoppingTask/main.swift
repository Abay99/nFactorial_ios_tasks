//
//  main.swift
//  ShoppingTask
//
//  Created by Abai Kalikov on 6/26/18.
//  Copyright © 2018 Abai Kalikov. All rights reserved.
//

import Foundation

let products: [Product] = [
    Product.init(id: 0, product_name: "Banana", price: 150),
    Product.init(id: 1, product_name: "Orange", price: 100),
    Product.init(id: 2, product_name: "Apple", price: 150),
    Product.init(id: 3, product_name: "Strawberry", price: 100),
    Product.init(id: 4, product_name: "Cherry", price: 50)
]

func adding_to_cart(chosen_id: Int){
    let cart = Product(id: chosen_id, product_name: products[chosen_id].Product_name, price: products[chosen_id].Price)
    Cart.cart_arr.append(cart)
}

func remove_from_cart(chosen_id: Int){
    var index = 0
    for product in Cart.cart_arr{
        if(product.Id == chosen_id){
            Cart.cart_arr.remove(at: index)
        }
        else{
            index += 1
        }
    }
}

print("What is your name?")
let name = getln()
print("How much money do you have?")
let balance = getln()
print("Nice to meet you \(name), My name is KAS, i'm oldest friend of Siri")

func checkout(){
    let carts = Cart.cart_arr
    var sum = 0
    for cart in carts {
        sum += cart.Price
    }
    if(sum>Int(balance)!){
        print("Sorry your balance is not enough to buy things in a cart")
        print("Now, Total sum in a cart is \(sum)")
    }else{
        print("Do you want to buy it? Yes or No")
        let answer = getln()
        switch answer{
        case "Yes":
            print("Succesful purchase")
            print("Total sum is \(sum) and you have \(Int(balance)!-sum)tg left money")
            flag = false
        case "No":
            print("Let's continue to choose products")
        default:
            print("Answer is not applicable")
        }
    }
}

func unavailable_goods(chosen_id: Int){
    if Int(chosen_id) <= products.count-1{
        adding_to_cart(chosen_id: Int(chosen_id))
    }
    else{
        print("You can’t buy goods that are unavailable")
    }
}

var flag = true

    while(flag == true){
        print("Choose operation ([show]|[cart]|[choose]|[remove]|[checkout])")
        let operation = getln()

        switch operation {
            
            case "show":
                let show = Cart(products: products)
                print(show.show(products: products))
            
            case "choose":
                print("Choose product by id:")
                let chosen_id = getln()
                unavailable_goods(chosen_id: Int(chosen_id)!)
            
            case "cart":
                let show_cart = Cart(products: Cart.cart_arr)
                print(show_cart.show(products: Cart.cart_arr))
            
            case "remove":
                print("Choose product by id:")
                let removed_id = getln()
                remove_from_cart(chosen_id: Int(removed_id)!)
            
            case "checkout":
                print(checkout())
            
            default:
                print("Answer is not applicable")
        }
    }



