//
//  List.swift
//  ToDoList
//
//  Created by Abai Kalikov on 6/28/18.
//  Copyright © 2018 Abai Kalikov. All rights reserved.
//

import Foundation
import UIKit

class List {
    
    var event: String?
    var date: String?
    var photo: UIImage?
    
    init(_ event: String, _ date: String, _ photo: UIImage) {
        self.event = event;
        self.date = date
        self.photo = photo
    }
}
