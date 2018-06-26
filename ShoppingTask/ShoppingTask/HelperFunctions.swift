//
//  HelperFunctions.swift
//  ShoppingTask
//
//  Created by Abai Kalikov on 6/26/18.
//  Copyright © 2018 Abai Kalikov. All rights reserved.
//

import Foundation

func getln() -> String {
    let stdin = FileHandle.standardInput
    var input = NSString(data: stdin.availableData, encoding: String.Encoding.utf8.rawValue)
    input = input!.trimmingCharacters(in: NSCharacterSet.newlines) as NSString
    return input! as String
}
