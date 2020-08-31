//
//  Meal.swift
//  eggplant-browni
//
//  Created by Julio Sandroni on 30/08/20.
//  Copyright © 2020 Sandroni. All rights reserved.
//

import UIKit

class Meal: NSObject {
    let name:String
    let happy:Int
    let list:Array<Item> = []
    
    init(name:String,happy:Int) {
        self.name=name
        self.happy=happy
    }
    
    func printList(){
        
        var count = 1
        for item in self.list{
            print("#Item \(count) - \(item.name) -------- \(item.cal)")
            count+=1
        }
    }
    
    func sumCal(){
        var total:Double = 0
        
        for item in self.list{
            total+=item.cal
        }
        
        print("Total de calorias \(total)")
    }
}
