//
//  Color.swift
//  SuperMatimatician
//
//  Created by Abai Kalikov on 6/29/18.
//  Copyright © 2018 Abai Kalikov. All rights reserved.
//
import UIKit
import Foundation
class Color{
    var index: Int?
    var colorName: String?
    var color: UIColor?
    
    init(_ index:Int,_ colorName: String,      _ color: UIColor) {
        self.colorName = colorName
        self.color = color
    }
}
