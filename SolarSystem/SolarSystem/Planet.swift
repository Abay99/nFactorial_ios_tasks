//
//  Planet.swift
//  SolarSystem
//
//  Created by Abai Kalikov on 6/25/18.
//  Copyright © 2018 Abai Kalikov. All rights reserved.
//

import Foundation
class Planet {
//    var name: String
//    var description: String
//    init(name: String, description: String) {
//        self.name = name
//        self.description = description
//    }
//    
//    var Name: String?{
//        get{
//            return name
//        }
//    }
//    var Description: String?{
//        get{
//            return description
//        }
//    }
    
    func choice(planet_name: String) -> String {
        return solar_systems[planet_name]!
    }
    
    func randomPlanet(solar_sys_array: [String]) -> String {
        let randomIndex = Int(arc4random_uniform(UInt32(solar_sys_array.count)))
        let planet_name = solar_sys_array[randomIndex]
        return planet_name
    }
}
