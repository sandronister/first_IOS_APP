//
//  ViewController.swift
//  eggplant-browni
//
//  Created by Julio Sandroni on 29/08/20.
//  Copyright © 2020 Sandroni. All rights reserved.
//

import UIKit

protocol addMealsDelegate {
    func add(_ meal:Meal)
}

class ViewController: UIViewController {
    
    var delegate:addMealsDelegate?

    @IBOutlet var nameTextField:UITextField?
    @IBOutlet var levelHappyTextField:UITextField?
   
    @IBAction func add(_ sender: Any) {
        
        guard
            let name = nameTextField?.text,
            let happyMeal = levelHappyTextField?.text,
            let happy = Int(happyMeal)
            else {
            return
        }
        
        let myMeal = Meal(name:name,happy:happy)
        
        print("Eu tive um \(myMeal.name) com felicidade \(myMeal.happy)")
        
        delegate?.add(myMeal)
        
        navigationController?.popViewController(animated: true)

    }
}

