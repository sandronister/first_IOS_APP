//
//  Meal.swift
//  eggplant-browni
//
//  Created by Julio Sandroni on 30/08/20.
//  Copyright © 2020 Sandroni. All rights reserved.
//

import UIKit

class Meal: NSObject, NSCoding {
   
    // MARK: - Atributes
    let name:String
    let happy:Int
    var itens:Array<Item> = []
    
    // MARK: - Init
    init(name:String,happy:Int,itens:[Item]=[]) {
        self.name=name
        self.happy=happy
        self.itens = itens
    }
    
    // MARK: - NScoding Methods
     func encode(with coder: NSCoder) {
         coder.encode(name,forKey: "name")
         coder.encode(happy,forKey:"happy")
         coder.encode(itens,forKey: "itens")
     }
        
     required init?(coder: NSCoder) {
        self.name = coder.decodeObject(forKey:"name") as! String
        self.happy = coder.decodeInteger(forKey: "happy")
        self.itens = coder.decodeObject(forKey: "itens") as! Array<Item>
     }
    
    // MARK: - Methods
    func printList(){
        
        var count = 1
        for item in self.itens{
            print("#Item \(count) - \(item.name) -------- \(item.cal)")
            count+=1
        }
    }
    
    func sumCal(){
        var total:Double = 0
        
        for item in self.itens{
            total+=item.cal
        }
        
        print("Total de calorias \(total)")
    }
    
    func message()->String{
        var message = "Felicidade \(self.happy)\n"
        
        var count = 1
        for item in self.itens{
            message+="#\(count) -- \(item.name) \(item.cal)\n"
            count+=1
        }
        
        return message
    }
}
