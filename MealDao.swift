//
//  MealDao.swift
//  eggplant-browni
//
//  Created by Julio Sandroni on 07/09/20.
//  Copyright © 2020 Sandroni. All rights reserved.
//

import Foundation


class MealDao{
    
    func getPath()->URL?{
        guard let mainDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return mainDir.appendingPathComponent("meals")
    }
    
    func save(_ list:[Meal]){
        do {
            guard let dir = self.getPath() else { return}
           let data = try NSKeyedArchiver.archivedData(withRootObject: list, requiringSecureCoding: false)
           try data.write(to: dir)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func load()->Array<Meal>?{
        guard let dir = self.getPath() else { return [] }
        
        do{
            let data = try Data(contentsOf: dir)
            guard let list = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Array<Meal> else {return []}
            return list
              
        }catch{
            print(error.localizedDescription)
            return []
        }
    }
}
