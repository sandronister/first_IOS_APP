//
//  Item.swift
//  eggplant-browni
//
//  Created by Julio Sandroni on 30/08/20.
//  Copyright © 2020 Sandroni. All rights reserved.
//

import UIKit

class Item: NSObject {
    let name:String
    let cal:Double
       
    init(name:String,cal:Double) {
        self.name = name
        self.cal = cal
    }
}
