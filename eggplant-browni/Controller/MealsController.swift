//
//  mealsController.swift
//  eggplant-browni
//
//  Created by Julio Sandroni on 30/08/20.
//  Copyright © 2020 Sandroni. All rights reserved.
//

import UIKit

class MealsController: UITableViewController, addMealsDelegate {
    
    var listMeals = [Meal(name: "Shawarma", happy:5),Meal(name:"Entrecote", happy:5),Meal(name: "Chorizo", happy:4),Meal(name: "Feijoada", happy:3)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMeals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let item = listMeals[indexPath.row]
        
        cell.textLabel?.text = item.name
        
        return cell
    }
    
    func add(_ meal:Meal){
        self.listMeals.append(meal)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addMealSG"{
            if let viewController = segue.destination as? ViewController{
                viewController.delegate = self
            }
        }
    }

}
