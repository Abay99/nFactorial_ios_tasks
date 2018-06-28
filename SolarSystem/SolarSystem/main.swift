//
//  main.swift
//  SolarSystem
//
//  Created by Abai Kalikov on 6/25/18.
//  Copyright © 2018 Abai Kalikov. All rights reserved.
//

import Foundation

var planet = Planet()

let solar_systems: Dictionary<String,String> = [
    "Mercury": "is the closest planet to the Sun and the smallest planet in the Solar System",
    "Venus": "is close in size to Earth",
    "Earth": "is the largest and densest of the inner planets, the only one known to have current geological activity",
    "Mars": "is smaller than Earth and Venus",
    "Jupiter": "is 2.5 times the mass of all the other planets put together",
    "Saturn": "distinguished by its extensive ring system, has several similarities to Jupiter",
    "Uranus": "is the lightest of the outer planets",
    "Neptune": "though slightly smaller than Uranus, is more massive and hence more dense",
    "Centaurs": "are icy comet-like bodies whose orbits have semi-major axes greater than Jupiter's and less than Neptune's"]

let solar_sys_array = Array(solar_systems.keys)

print("Welcome to Planets of the Solar System")
print("What is your name?")
var name_in = getln()

print("My name is KAS, i'm oldest friend of Siri and nice to meet you, \(name_in)")

var flag: Bool = true

while(flag == true){
    print("Do you want to choose randomly?, answer: Yes, No or Exit in order to stop adventuring")
    var answer_in = getln()
    switch answer_in {
        case "Yes":
            var planet_name = planet.randomPlanet(solar_sys_array: solar_sys_array)
            print("\(planet_name) \(planet.choice(planet_name: planet_name))")
        case "No":
            print("Enter name of planet, that you want to visit?")
            let entered_planet_name = getln()
            print("\(entered_planet_name) \(planet.choice(planet_name: entered_planet_name))")
        case "Exit":
            print("stop adventuring in Solar System")
            flag = false
        default:
            print("Answer is not applicable")
    }
}


//if answer_in == "Yes"{
//    let randomIndex = Int(arc4random_uniform(UInt32(solar_sys_array.count)))
//    let planet_name = solar_sys_array[randomIndex]
//    print(choice(planet_name: planet_name))
//}
//else if answer_in == "No"{
//    print("Enter name of planet, that you want to visit?")
//    let entered_planet_name = getln()
//    print(choice(planet_name: entered_planet_name))
//}
//else{
//    print("Answer is not applicable")
//}

